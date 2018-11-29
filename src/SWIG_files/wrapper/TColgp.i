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
%define TCOLGPDOCSTRING
"
-Purpose :  This package provides standard and frequently
used instantiations of generic classes from the
TCollection package with geometric objects from the gp package.
"
%enddef
%module (package="OCC.Core", docstring=TCOLGPDOCSTRING) TColgp

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
%include ../common/OccHandle.i


%include TColgp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(TColgp_HArray1OfCirc2d)
%wrap_handle(TColgp_HArray1OfDir)
%wrap_handle(TColgp_HArray1OfDir2d)
%wrap_handle(TColgp_HArray1OfLin2d)
%wrap_handle(TColgp_HArray1OfPnt)
%wrap_handle(TColgp_HArray1OfPnt2d)
%wrap_handle(TColgp_HArray1OfVec)
%wrap_handle(TColgp_HArray1OfVec2d)
%wrap_handle(TColgp_HArray1OfXY)
%wrap_handle(TColgp_HArray1OfXYZ)
%wrap_handle(TColgp_HArray2OfCirc2d)
%wrap_handle(TColgp_HArray2OfDir)
%wrap_handle(TColgp_HArray2OfDir2d)
%wrap_handle(TColgp_HArray2OfLin2d)
%wrap_handle(TColgp_HArray2OfPnt)
%wrap_handle(TColgp_HArray2OfPnt2d)
%wrap_handle(TColgp_HArray2OfVec)
%wrap_handle(TColgp_HArray2OfVec2d)
%wrap_handle(TColgp_HArray2OfXY)
%wrap_handle(TColgp_HArray2OfXYZ)
%wrap_handle(TColgp_HSequenceOfDir)
%wrap_handle(TColgp_HSequenceOfDir2d)
%wrap_handle(TColgp_HSequenceOfPnt)
%wrap_handle(TColgp_HSequenceOfPnt2d)
%wrap_handle(TColgp_HSequenceOfVec)
%wrap_handle(TColgp_HSequenceOfVec2d)
%wrap_handle(TColgp_HSequenceOfXY)
%wrap_handle(TColgp_HSequenceOfXYZ)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfAx1)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfDir)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfDir2d)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfPnt)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfPnt2d)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfVec)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfVec2d)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfXY)
%wrap_handle(TColgp_SequenceNodeOfSequenceOfXYZ)

%nodefaultctor TColgp_Array1OfCirc2d;
class TColgp_Array1OfCirc2d {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfCirc2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfCirc2d;
		 TColgp_Array1OfCirc2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfCirc2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Circ2d
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfCirc2d;
		 TColgp_Array1OfCirc2d (const gp_Circ2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Circ2d
	:rtype: None
") Init;
		void Init (const gp_Circ2d & V);
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
	:type Other: TColgp_Array1OfCirc2d
	:rtype: TColgp_Array1OfCirc2d
") Assign;
		const TColgp_Array1OfCirc2d & Assign (const TColgp_Array1OfCirc2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfCirc2d
	:rtype: TColgp_Array1OfCirc2d
") operator =;
		const TColgp_Array1OfCirc2d & operator = (const TColgp_Array1OfCirc2d & Other);
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
	:type Value: gp_Circ2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Circ2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") Value;
		const gp_Circ2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ChangeValue;
		gp_Circ2d  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfCirc2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfCirc2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfDir;
class TColgp_Array1OfDir {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfDir;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfDir;
		 TColgp_Array1OfDir (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfDir;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Dir
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfDir;
		 TColgp_Array1OfDir (const gp_Dir & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir
	:rtype: None
") Init;
		void Init (const gp_Dir & V);
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
	:type Other: TColgp_Array1OfDir
	:rtype: TColgp_Array1OfDir
") Assign;
		const TColgp_Array1OfDir & Assign (const TColgp_Array1OfDir & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfDir
	:rtype: TColgp_Array1OfDir
") operator =;
		const TColgp_Array1OfDir & operator = (const TColgp_Array1OfDir & Other);
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
	:type Value: gp_Dir
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Dir & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir
") Value;
		const gp_Dir  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir
") ChangeValue;
		gp_Dir  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfDir {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfDir2d;
class TColgp_Array1OfDir2d {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfDir2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfDir2d;
		 TColgp_Array1OfDir2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfDir2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Dir2d
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfDir2d;
		 TColgp_Array1OfDir2d (const gp_Dir2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir2d
	:rtype: None
") Init;
		void Init (const gp_Dir2d & V);
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
	:type Other: TColgp_Array1OfDir2d
	:rtype: TColgp_Array1OfDir2d
") Assign;
		const TColgp_Array1OfDir2d & Assign (const TColgp_Array1OfDir2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfDir2d
	:rtype: TColgp_Array1OfDir2d
") operator =;
		const TColgp_Array1OfDir2d & operator = (const TColgp_Array1OfDir2d & Other);
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
	:type Value: gp_Dir2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Dir2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir2d
") Value;
		const gp_Dir2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir2d
") ChangeValue;
		gp_Dir2d  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfDir2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfLin2d;
class TColgp_Array1OfLin2d {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfLin2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfLin2d;
		 TColgp_Array1OfLin2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfLin2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Lin2d
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfLin2d;
		 TColgp_Array1OfLin2d (const gp_Lin2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Lin2d
	:rtype: None
") Init;
		void Init (const gp_Lin2d & V);
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
	:type Other: TColgp_Array1OfLin2d
	:rtype: TColgp_Array1OfLin2d
") Assign;
		const TColgp_Array1OfLin2d & Assign (const TColgp_Array1OfLin2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfLin2d
	:rtype: TColgp_Array1OfLin2d
") operator =;
		const TColgp_Array1OfLin2d & operator = (const TColgp_Array1OfLin2d & Other);
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
	:type Value: gp_Lin2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Lin2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Lin2d
") Value;
		const gp_Lin2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Lin2d
") ChangeValue;
		gp_Lin2d  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfLin2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfLin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfPnt;
class TColgp_Array1OfPnt {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfPnt;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfPnt;
		 TColgp_Array1OfPnt (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfPnt;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Pnt
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfPnt;
		 TColgp_Array1OfPnt (const gp_Pnt & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Pnt
	:rtype: None
") Init;
		void Init (const gp_Pnt & V);
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
	:type Other: TColgp_Array1OfPnt
	:rtype: TColgp_Array1OfPnt
") Assign;
		const TColgp_Array1OfPnt & Assign (const TColgp_Array1OfPnt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfPnt
	:rtype: TColgp_Array1OfPnt
") operator =;
		const TColgp_Array1OfPnt & operator = (const TColgp_Array1OfPnt & Other);
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
	:type Value: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Pnt & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") ChangeValue;
		gp_Pnt  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfPnt {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfPnt2d;
class TColgp_Array1OfPnt2d {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfPnt2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfPnt2d;
		 TColgp_Array1OfPnt2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfPnt2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Pnt2d
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfPnt2d;
		 TColgp_Array1OfPnt2d (const gp_Pnt2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Pnt2d
	:rtype: None
") Init;
		void Init (const gp_Pnt2d & V);
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
	:type Other: TColgp_Array1OfPnt2d
	:rtype: TColgp_Array1OfPnt2d
") Assign;
		const TColgp_Array1OfPnt2d & Assign (const TColgp_Array1OfPnt2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfPnt2d
	:rtype: TColgp_Array1OfPnt2d
") operator =;
		const TColgp_Array1OfPnt2d & operator = (const TColgp_Array1OfPnt2d & Other);
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
	:type Value: gp_Pnt2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Pnt2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") ChangeValue;
		gp_Pnt2d  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfPnt2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfVec;
class TColgp_Array1OfVec {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfVec;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfVec;
		 TColgp_Array1OfVec (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfVec;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Vec
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfVec;
		 TColgp_Array1OfVec (const gp_Vec & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Init;
		void Init (const gp_Vec & V);
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
	:type Other: TColgp_Array1OfVec
	:rtype: TColgp_Array1OfVec
") Assign;
		const TColgp_Array1OfVec & Assign (const TColgp_Array1OfVec & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfVec
	:rtype: TColgp_Array1OfVec
") operator =;
		const TColgp_Array1OfVec & operator = (const TColgp_Array1OfVec & Other);
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
	:type Value: gp_Vec
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Vec & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec
") Value;
		const gp_Vec  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec
") ChangeValue;
		gp_Vec  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfVec {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfVec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfVec2d;
class TColgp_Array1OfVec2d {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfVec2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfVec2d;
		 TColgp_Array1OfVec2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfVec2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Vec2d
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfVec2d;
		 TColgp_Array1OfVec2d (const gp_Vec2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Init;
		void Init (const gp_Vec2d & V);
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
	:type Other: TColgp_Array1OfVec2d
	:rtype: TColgp_Array1OfVec2d
") Assign;
		const TColgp_Array1OfVec2d & Assign (const TColgp_Array1OfVec2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfVec2d
	:rtype: TColgp_Array1OfVec2d
") operator =;
		const TColgp_Array1OfVec2d & operator = (const TColgp_Array1OfVec2d & Other);
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
	:type Value: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Vec2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec2d
") Value;
		const gp_Vec2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec2d
") ChangeValue;
		gp_Vec2d  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfVec2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfVec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfXY;
class TColgp_Array1OfXY {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfXY;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfXY;
		 TColgp_Array1OfXY (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfXY;
		%feature("autodoc", "	:param Item:
	:type Item: gp_XY
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfXY;
		 TColgp_Array1OfXY (const gp_XY & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_XY
	:rtype: None
") Init;
		void Init (const gp_XY & V);
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
	:type Other: TColgp_Array1OfXY
	:rtype: TColgp_Array1OfXY
") Assign;
		const TColgp_Array1OfXY & Assign (const TColgp_Array1OfXY & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfXY
	:rtype: TColgp_Array1OfXY
") operator =;
		const TColgp_Array1OfXY & operator = (const TColgp_Array1OfXY & Other);
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
	:type Value: gp_XY
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_XY & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XY
") Value;
		const gp_XY  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XY
") ChangeValue;
		gp_XY  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfXY {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfXY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array1OfXYZ;
class TColgp_Array1OfXYZ {
	public:
		%feature("compactdefaultargs") TColgp_Array1OfXYZ;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfXYZ;
		 TColgp_Array1OfXYZ (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_Array1OfXYZ;
		%feature("autodoc", "	:param Item:
	:type Item: gp_XYZ
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_Array1OfXYZ;
		 TColgp_Array1OfXYZ (const gp_XYZ & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_XYZ
	:rtype: None
") Init;
		void Init (const gp_XYZ & V);
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
	:type Other: TColgp_Array1OfXYZ
	:rtype: TColgp_Array1OfXYZ
") Assign;
		const TColgp_Array1OfXYZ & Assign (const TColgp_Array1OfXYZ & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array1OfXYZ
	:rtype: TColgp_Array1OfXYZ
") operator =;
		const TColgp_Array1OfXYZ & operator = (const TColgp_Array1OfXYZ & Other);
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
	:type Value: gp_XYZ
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_XYZ & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XYZ
") Value;
		const gp_XYZ  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XYZ
") ChangeValue;
		gp_XYZ  ChangeValue (const Standard_Integer Index);
};



%extend TColgp_Array1OfXYZ {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_Array1OfXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfCirc2d;
class TColgp_Array2OfCirc2d {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfCirc2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfCirc2d;
		 TColgp_Array2OfCirc2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfCirc2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Circ2d
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfCirc2d;
		 TColgp_Array2OfCirc2d (const gp_Circ2d & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Circ2d
	:rtype: None
") Init;
		void Init (const gp_Circ2d & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfCirc2d
	:rtype: TColgp_Array2OfCirc2d
") Assign;
		const TColgp_Array2OfCirc2d & Assign (const TColgp_Array2OfCirc2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfCirc2d
	:rtype: TColgp_Array2OfCirc2d
") operator =;
		const TColgp_Array2OfCirc2d & operator = (const TColgp_Array2OfCirc2d & Other);
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
	:type Value: gp_Circ2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Circ2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Circ2d
") Value;
		const gp_Circ2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Circ2d
") ChangeValue;
		gp_Circ2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfCirc2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfDir;
class TColgp_Array2OfDir {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfDir;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfDir;
		 TColgp_Array2OfDir (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfDir;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Dir
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfDir;
		 TColgp_Array2OfDir (const gp_Dir & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir
	:rtype: None
") Init;
		void Init (const gp_Dir & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfDir
	:rtype: TColgp_Array2OfDir
") Assign;
		const TColgp_Array2OfDir & Assign (const TColgp_Array2OfDir & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfDir
	:rtype: TColgp_Array2OfDir
") operator =;
		const TColgp_Array2OfDir & operator = (const TColgp_Array2OfDir & Other);
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
	:type Value: gp_Dir
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Dir & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Dir
") Value;
		const gp_Dir  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Dir
") ChangeValue;
		gp_Dir  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfDir2d;
class TColgp_Array2OfDir2d {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfDir2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfDir2d;
		 TColgp_Array2OfDir2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfDir2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Dir2d
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfDir2d;
		 TColgp_Array2OfDir2d (const gp_Dir2d & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir2d
	:rtype: None
") Init;
		void Init (const gp_Dir2d & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfDir2d
	:rtype: TColgp_Array2OfDir2d
") Assign;
		const TColgp_Array2OfDir2d & Assign (const TColgp_Array2OfDir2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfDir2d
	:rtype: TColgp_Array2OfDir2d
") operator =;
		const TColgp_Array2OfDir2d & operator = (const TColgp_Array2OfDir2d & Other);
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
	:type Value: gp_Dir2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Dir2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Dir2d
") Value;
		const gp_Dir2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Dir2d
") ChangeValue;
		gp_Dir2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfLin2d;
class TColgp_Array2OfLin2d {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfLin2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfLin2d;
		 TColgp_Array2OfLin2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfLin2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Lin2d
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfLin2d;
		 TColgp_Array2OfLin2d (const gp_Lin2d & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Lin2d
	:rtype: None
") Init;
		void Init (const gp_Lin2d & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfLin2d
	:rtype: TColgp_Array2OfLin2d
") Assign;
		const TColgp_Array2OfLin2d & Assign (const TColgp_Array2OfLin2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfLin2d
	:rtype: TColgp_Array2OfLin2d
") operator =;
		const TColgp_Array2OfLin2d & operator = (const TColgp_Array2OfLin2d & Other);
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
	:type Value: gp_Lin2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Lin2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Lin2d
") Value;
		const gp_Lin2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Lin2d
") ChangeValue;
		gp_Lin2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfLin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfPnt;
class TColgp_Array2OfPnt {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfPnt;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfPnt;
		 TColgp_Array2OfPnt (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfPnt;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Pnt
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfPnt;
		 TColgp_Array2OfPnt (const gp_Pnt & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Pnt
	:rtype: None
") Init;
		void Init (const gp_Pnt & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfPnt
	:rtype: TColgp_Array2OfPnt
") Assign;
		const TColgp_Array2OfPnt & Assign (const TColgp_Array2OfPnt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfPnt
	:rtype: TColgp_Array2OfPnt
") operator =;
		const TColgp_Array2OfPnt & operator = (const TColgp_Array2OfPnt & Other);
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
	:type Value: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Pnt & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Pnt
") ChangeValue;
		gp_Pnt  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfPnt2d;
class TColgp_Array2OfPnt2d {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfPnt2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfPnt2d;
		 TColgp_Array2OfPnt2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfPnt2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Pnt2d
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfPnt2d;
		 TColgp_Array2OfPnt2d (const gp_Pnt2d & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Pnt2d
	:rtype: None
") Init;
		void Init (const gp_Pnt2d & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfPnt2d
	:rtype: TColgp_Array2OfPnt2d
") Assign;
		const TColgp_Array2OfPnt2d & Assign (const TColgp_Array2OfPnt2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfPnt2d
	:rtype: TColgp_Array2OfPnt2d
") operator =;
		const TColgp_Array2OfPnt2d & operator = (const TColgp_Array2OfPnt2d & Other);
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
	:type Value: gp_Pnt2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Pnt2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Pnt2d
") ChangeValue;
		gp_Pnt2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfVec;
class TColgp_Array2OfVec {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfVec;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfVec;
		 TColgp_Array2OfVec (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfVec;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Vec
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfVec;
		 TColgp_Array2OfVec (const gp_Vec & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Init;
		void Init (const gp_Vec & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfVec
	:rtype: TColgp_Array2OfVec
") Assign;
		const TColgp_Array2OfVec & Assign (const TColgp_Array2OfVec & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfVec
	:rtype: TColgp_Array2OfVec
") operator =;
		const TColgp_Array2OfVec & operator = (const TColgp_Array2OfVec & Other);
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
	:type Value: gp_Vec
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Vec & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Vec
") Value;
		const gp_Vec  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Vec
") ChangeValue;
		gp_Vec  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfVec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfVec2d;
class TColgp_Array2OfVec2d {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfVec2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfVec2d;
		 TColgp_Array2OfVec2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfVec2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Vec2d
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfVec2d;
		 TColgp_Array2OfVec2d (const gp_Vec2d & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Init;
		void Init (const gp_Vec2d & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfVec2d
	:rtype: TColgp_Array2OfVec2d
") Assign;
		const TColgp_Array2OfVec2d & Assign (const TColgp_Array2OfVec2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfVec2d
	:rtype: TColgp_Array2OfVec2d
") operator =;
		const TColgp_Array2OfVec2d & operator = (const TColgp_Array2OfVec2d & Other);
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
	:type Value: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Vec2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Vec2d
") Value;
		const gp_Vec2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Vec2d
") ChangeValue;
		gp_Vec2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfVec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfXY;
class TColgp_Array2OfXY {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfXY;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfXY;
		 TColgp_Array2OfXY (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfXY;
		%feature("autodoc", "	:param Item:
	:type Item: gp_XY
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfXY;
		 TColgp_Array2OfXY (const gp_XY & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_XY
	:rtype: None
") Init;
		void Init (const gp_XY & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfXY
	:rtype: TColgp_Array2OfXY
") Assign;
		const TColgp_Array2OfXY & Assign (const TColgp_Array2OfXY & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfXY
	:rtype: TColgp_Array2OfXY
") operator =;
		const TColgp_Array2OfXY & operator = (const TColgp_Array2OfXY & Other);
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
	:type Value: gp_XY
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_XY & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_XY
") Value;
		const gp_XY  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_XY
") ChangeValue;
		gp_XY  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfXY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_Array2OfXYZ;
class TColgp_Array2OfXYZ {
	public:
		%feature("compactdefaultargs") TColgp_Array2OfXYZ;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfXYZ;
		 TColgp_Array2OfXYZ (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_Array2OfXYZ;
		%feature("autodoc", "	:param Item:
	:type Item: gp_XYZ
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_Array2OfXYZ;
		 TColgp_Array2OfXYZ (const gp_XYZ & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_XYZ
	:rtype: None
") Init;
		void Init (const gp_XYZ & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfXYZ
	:rtype: TColgp_Array2OfXYZ
") Assign;
		const TColgp_Array2OfXYZ & Assign (const TColgp_Array2OfXYZ & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_Array2OfXYZ
	:rtype: TColgp_Array2OfXYZ
") operator =;
		const TColgp_Array2OfXYZ & operator = (const TColgp_Array2OfXYZ & Other);
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
	:type Value: gp_XYZ
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_XYZ & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_XYZ
") Value;
		const gp_XYZ  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_XYZ
") ChangeValue;
		gp_XYZ  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColgp_Array2OfXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfCirc2d;
class TColgp_HArray1OfCirc2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfCirc2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfCirc2d;
		 TColgp_HArray1OfCirc2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfCirc2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Circ2d
	:rtype: None
") TColgp_HArray1OfCirc2d;
		 TColgp_HArray1OfCirc2d (const Standard_Integer Low,const Standard_Integer Up,const gp_Circ2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Circ2d
	:rtype: None
") Init;
		void Init (const gp_Circ2d & V);
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
	:type Value: gp_Circ2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Circ2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") Value;
		const gp_Circ2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ChangeValue;
		gp_Circ2d  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfCirc2d
") Array1;
		const TColgp_Array1OfCirc2d & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfCirc2d
") ChangeArray1;
		TColgp_Array1OfCirc2d & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfCirc2d)


%extend TColgp_HArray1OfCirc2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfCirc2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfDir;
class TColgp_HArray1OfDir : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfDir;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfDir;
		 TColgp_HArray1OfDir (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfDir;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Dir
	:rtype: None
") TColgp_HArray1OfDir;
		 TColgp_HArray1OfDir (const Standard_Integer Low,const Standard_Integer Up,const gp_Dir & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir
	:rtype: None
") Init;
		void Init (const gp_Dir & V);
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
	:type Value: gp_Dir
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Dir & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir
") Value;
		const gp_Dir  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir
") ChangeValue;
		gp_Dir  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfDir
") Array1;
		const TColgp_Array1OfDir & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfDir
") ChangeArray1;
		TColgp_Array1OfDir & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfDir)


%extend TColgp_HArray1OfDir {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfDir2d;
class TColgp_HArray1OfDir2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfDir2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfDir2d;
		 TColgp_HArray1OfDir2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfDir2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Dir2d
	:rtype: None
") TColgp_HArray1OfDir2d;
		 TColgp_HArray1OfDir2d (const Standard_Integer Low,const Standard_Integer Up,const gp_Dir2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir2d
	:rtype: None
") Init;
		void Init (const gp_Dir2d & V);
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
	:type Value: gp_Dir2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Dir2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir2d
") Value;
		const gp_Dir2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir2d
") ChangeValue;
		gp_Dir2d  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfDir2d
") Array1;
		const TColgp_Array1OfDir2d & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfDir2d
") ChangeArray1;
		TColgp_Array1OfDir2d & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfDir2d)


%extend TColgp_HArray1OfDir2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfLin2d;
class TColgp_HArray1OfLin2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfLin2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfLin2d;
		 TColgp_HArray1OfLin2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfLin2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Lin2d
	:rtype: None
") TColgp_HArray1OfLin2d;
		 TColgp_HArray1OfLin2d (const Standard_Integer Low,const Standard_Integer Up,const gp_Lin2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Lin2d
	:rtype: None
") Init;
		void Init (const gp_Lin2d & V);
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
	:type Value: gp_Lin2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Lin2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Lin2d
") Value;
		const gp_Lin2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Lin2d
") ChangeValue;
		gp_Lin2d  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfLin2d
") Array1;
		const TColgp_Array1OfLin2d & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfLin2d
") ChangeArray1;
		TColgp_Array1OfLin2d & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfLin2d)


%extend TColgp_HArray1OfLin2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfLin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfPnt;
class TColgp_HArray1OfPnt : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfPnt;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfPnt;
		 TColgp_HArray1OfPnt (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfPnt;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Pnt
	:rtype: None
") TColgp_HArray1OfPnt;
		 TColgp_HArray1OfPnt (const Standard_Integer Low,const Standard_Integer Up,const gp_Pnt & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Pnt
	:rtype: None
") Init;
		void Init (const gp_Pnt & V);
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
	:type Value: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Pnt & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") ChangeValue;
		gp_Pnt  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfPnt
") Array1;
		const TColgp_Array1OfPnt & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfPnt
") ChangeArray1;
		TColgp_Array1OfPnt & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfPnt)


%extend TColgp_HArray1OfPnt {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfPnt2d;
class TColgp_HArray1OfPnt2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfPnt2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfPnt2d;
		 TColgp_HArray1OfPnt2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfPnt2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Pnt2d
	:rtype: None
") TColgp_HArray1OfPnt2d;
		 TColgp_HArray1OfPnt2d (const Standard_Integer Low,const Standard_Integer Up,const gp_Pnt2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Pnt2d
	:rtype: None
") Init;
		void Init (const gp_Pnt2d & V);
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
	:type Value: gp_Pnt2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Pnt2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") ChangeValue;
		gp_Pnt2d  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfPnt2d
") Array1;
		const TColgp_Array1OfPnt2d & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfPnt2d
") ChangeArray1;
		TColgp_Array1OfPnt2d & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfPnt2d)


%extend TColgp_HArray1OfPnt2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfVec;
class TColgp_HArray1OfVec : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfVec;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfVec;
		 TColgp_HArray1OfVec (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfVec;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Vec
	:rtype: None
") TColgp_HArray1OfVec;
		 TColgp_HArray1OfVec (const Standard_Integer Low,const Standard_Integer Up,const gp_Vec & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Init;
		void Init (const gp_Vec & V);
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
	:type Value: gp_Vec
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Vec & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec
") Value;
		const gp_Vec  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec
") ChangeValue;
		gp_Vec  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfVec
") Array1;
		const TColgp_Array1OfVec & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfVec
") ChangeArray1;
		TColgp_Array1OfVec & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfVec)


%extend TColgp_HArray1OfVec {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfVec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfVec2d;
class TColgp_HArray1OfVec2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfVec2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfVec2d;
		 TColgp_HArray1OfVec2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfVec2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") TColgp_HArray1OfVec2d;
		 TColgp_HArray1OfVec2d (const Standard_Integer Low,const Standard_Integer Up,const gp_Vec2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Init;
		void Init (const gp_Vec2d & V);
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
	:type Value: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Vec2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec2d
") Value;
		const gp_Vec2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec2d
") ChangeValue;
		gp_Vec2d  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfVec2d
") Array1;
		const TColgp_Array1OfVec2d & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfVec2d
") ChangeArray1;
		TColgp_Array1OfVec2d & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfVec2d)


%extend TColgp_HArray1OfVec2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfVec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfXY;
class TColgp_HArray1OfXY : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfXY;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfXY;
		 TColgp_HArray1OfXY (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfXY;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_XY
	:rtype: None
") TColgp_HArray1OfXY;
		 TColgp_HArray1OfXY (const Standard_Integer Low,const Standard_Integer Up,const gp_XY & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_XY
	:rtype: None
") Init;
		void Init (const gp_XY & V);
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
	:type Value: gp_XY
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_XY & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XY
") Value;
		const gp_XY  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XY
") ChangeValue;
		gp_XY  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfXY
") Array1;
		const TColgp_Array1OfXY & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfXY
") ChangeArray1;
		TColgp_Array1OfXY & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfXY)


%extend TColgp_HArray1OfXY {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfXY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray1OfXYZ;
class TColgp_HArray1OfXYZ : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray1OfXYZ;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColgp_HArray1OfXYZ;
		 TColgp_HArray1OfXYZ (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColgp_HArray1OfXYZ;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_XYZ
	:rtype: None
") TColgp_HArray1OfXYZ;
		 TColgp_HArray1OfXYZ (const Standard_Integer Low,const Standard_Integer Up,const gp_XYZ & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_XYZ
	:rtype: None
") Init;
		void Init (const gp_XYZ & V);
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
	:type Value: gp_XYZ
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_XYZ & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XYZ
") Value;
		const gp_XYZ  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XYZ
") ChangeValue;
		gp_XYZ  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfXYZ
") Array1;
		const TColgp_Array1OfXYZ & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColgp_Array1OfXYZ
") ChangeArray1;
		TColgp_Array1OfXYZ & ChangeArray1 ();
};


%make_alias(TColgp_HArray1OfXYZ)


%extend TColgp_HArray1OfXYZ {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_HArray1OfXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfCirc2d;
class TColgp_HArray2OfCirc2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfCirc2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfCirc2d;
		 TColgp_HArray2OfCirc2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfCirc2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_Circ2d
	:rtype: None
") TColgp_HArray2OfCirc2d;
		 TColgp_HArray2OfCirc2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_Circ2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Circ2d
	:rtype: None
") Init;
		void Init (const gp_Circ2d & V);
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
	:type Value: gp_Circ2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Circ2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Circ2d
") Value;
		const gp_Circ2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Circ2d
") ChangeValue;
		gp_Circ2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfCirc2d
") Array2;
		const TColgp_Array2OfCirc2d & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfCirc2d
") ChangeArray2;
		TColgp_Array2OfCirc2d & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfCirc2d)

%extend TColgp_HArray2OfCirc2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfDir;
class TColgp_HArray2OfDir : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfDir;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfDir;
		 TColgp_HArray2OfDir (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfDir;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_Dir
	:rtype: None
") TColgp_HArray2OfDir;
		 TColgp_HArray2OfDir (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_Dir & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir
	:rtype: None
") Init;
		void Init (const gp_Dir & V);
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
	:type Value: gp_Dir
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Dir & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Dir
") Value;
		const gp_Dir  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Dir
") ChangeValue;
		gp_Dir  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfDir
") Array2;
		const TColgp_Array2OfDir & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfDir
") ChangeArray2;
		TColgp_Array2OfDir & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfDir)

%extend TColgp_HArray2OfDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfDir2d;
class TColgp_HArray2OfDir2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfDir2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfDir2d;
		 TColgp_HArray2OfDir2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfDir2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_Dir2d
	:rtype: None
") TColgp_HArray2OfDir2d;
		 TColgp_HArray2OfDir2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_Dir2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir2d
	:rtype: None
") Init;
		void Init (const gp_Dir2d & V);
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
	:type Value: gp_Dir2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Dir2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Dir2d
") Value;
		const gp_Dir2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Dir2d
") ChangeValue;
		gp_Dir2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfDir2d
") Array2;
		const TColgp_Array2OfDir2d & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfDir2d
") ChangeArray2;
		TColgp_Array2OfDir2d & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfDir2d)

%extend TColgp_HArray2OfDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfLin2d;
class TColgp_HArray2OfLin2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfLin2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfLin2d;
		 TColgp_HArray2OfLin2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfLin2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_Lin2d
	:rtype: None
") TColgp_HArray2OfLin2d;
		 TColgp_HArray2OfLin2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_Lin2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Lin2d
	:rtype: None
") Init;
		void Init (const gp_Lin2d & V);
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
	:type Value: gp_Lin2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Lin2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Lin2d
") Value;
		const gp_Lin2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Lin2d
") ChangeValue;
		gp_Lin2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfLin2d
") Array2;
		const TColgp_Array2OfLin2d & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfLin2d
") ChangeArray2;
		TColgp_Array2OfLin2d & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfLin2d)

%extend TColgp_HArray2OfLin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfPnt;
class TColgp_HArray2OfPnt : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfPnt;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfPnt;
		 TColgp_HArray2OfPnt (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfPnt;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_Pnt
	:rtype: None
") TColgp_HArray2OfPnt;
		 TColgp_HArray2OfPnt (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_Pnt & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Pnt
	:rtype: None
") Init;
		void Init (const gp_Pnt & V);
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
	:type Value: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Pnt & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Pnt
") ChangeValue;
		gp_Pnt  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") Array2;
		const TColgp_Array2OfPnt & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") ChangeArray2;
		TColgp_Array2OfPnt & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfPnt)

%extend TColgp_HArray2OfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfPnt2d;
class TColgp_HArray2OfPnt2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfPnt2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfPnt2d;
		 TColgp_HArray2OfPnt2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfPnt2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_Pnt2d
	:rtype: None
") TColgp_HArray2OfPnt2d;
		 TColgp_HArray2OfPnt2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_Pnt2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Pnt2d
	:rtype: None
") Init;
		void Init (const gp_Pnt2d & V);
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
	:type Value: gp_Pnt2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Pnt2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Pnt2d
") ChangeValue;
		gp_Pnt2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt2d
") Array2;
		const TColgp_Array2OfPnt2d & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt2d
") ChangeArray2;
		TColgp_Array2OfPnt2d & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfPnt2d)

%extend TColgp_HArray2OfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfVec;
class TColgp_HArray2OfVec : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfVec;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfVec;
		 TColgp_HArray2OfVec (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfVec;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_Vec
	:rtype: None
") TColgp_HArray2OfVec;
		 TColgp_HArray2OfVec (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_Vec & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Init;
		void Init (const gp_Vec & V);
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
	:type Value: gp_Vec
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Vec & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Vec
") Value;
		const gp_Vec  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Vec
") ChangeValue;
		gp_Vec  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfVec
") Array2;
		const TColgp_Array2OfVec & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfVec
") ChangeArray2;
		TColgp_Array2OfVec & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfVec)

%extend TColgp_HArray2OfVec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfVec2d;
class TColgp_HArray2OfVec2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfVec2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfVec2d;
		 TColgp_HArray2OfVec2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfVec2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") TColgp_HArray2OfVec2d;
		 TColgp_HArray2OfVec2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_Vec2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Init;
		void Init (const gp_Vec2d & V);
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
	:type Value: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_Vec2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Vec2d
") Value;
		const gp_Vec2d  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_Vec2d
") ChangeValue;
		gp_Vec2d  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfVec2d
") Array2;
		const TColgp_Array2OfVec2d & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfVec2d
") ChangeArray2;
		TColgp_Array2OfVec2d & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfVec2d)

%extend TColgp_HArray2OfVec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfXY;
class TColgp_HArray2OfXY : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfXY;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfXY;
		 TColgp_HArray2OfXY (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfXY;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_XY
	:rtype: None
") TColgp_HArray2OfXY;
		 TColgp_HArray2OfXY (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_XY & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_XY
	:rtype: None
") Init;
		void Init (const gp_XY & V);
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
	:type Value: gp_XY
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_XY & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_XY
") Value;
		const gp_XY  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_XY
") ChangeValue;
		gp_XY  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfXY
") Array2;
		const TColgp_Array2OfXY & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfXY
") ChangeArray2;
		TColgp_Array2OfXY & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfXY)

%extend TColgp_HArray2OfXY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HArray2OfXYZ;
class TColgp_HArray2OfXYZ : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HArray2OfXYZ;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColgp_HArray2OfXYZ;
		 TColgp_HArray2OfXYZ (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColgp_HArray2OfXYZ;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: gp_XYZ
	:rtype: None
") TColgp_HArray2OfXYZ;
		 TColgp_HArray2OfXYZ (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const gp_XYZ & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_XYZ
	:rtype: None
") Init;
		void Init (const gp_XYZ & V);
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
	:type Value: gp_XYZ
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const gp_XYZ & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_XYZ
") Value;
		const gp_XYZ  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: gp_XYZ
") ChangeValue;
		gp_XYZ  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfXYZ
") Array2;
		const TColgp_Array2OfXYZ & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColgp_Array2OfXYZ
") ChangeArray2;
		TColgp_Array2OfXYZ & ChangeArray2 ();
};


%make_alias(TColgp_HArray2OfXYZ)

%extend TColgp_HArray2OfXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HSequenceOfDir;
class TColgp_HSequenceOfDir : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HSequenceOfDir;
		%feature("autodoc", "	:rtype: None
") TColgp_HSequenceOfDir;
		 TColgp_HSequenceOfDir ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Dir
	:rtype: None
") Append;
		void Append (const gp_Dir & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfDir
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfDir & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Dir
	:rtype: None
") Prepend;
		void Prepend (const gp_Dir & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfDir
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfDir & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Dir
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const gp_Dir & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfDir
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfDir & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Dir
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const gp_Dir & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfDir
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfDir & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfDir
") Split;
		Handle_TColgp_HSequenceOfDir Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Dir
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const gp_Dir & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Dir
") Value;
		const gp_Dir  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Dir
") ChangeValue;
		gp_Dir  ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfDir
") Sequence;
		const TColgp_SequenceOfDir & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfDir
") ChangeSequence;
		TColgp_SequenceOfDir & ChangeSequence ();
};


%make_alias(TColgp_HSequenceOfDir)

%extend TColgp_HSequenceOfDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HSequenceOfDir2d;
class TColgp_HSequenceOfDir2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HSequenceOfDir2d;
		%feature("autodoc", "	:rtype: None
") TColgp_HSequenceOfDir2d;
		 TColgp_HSequenceOfDir2d ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Dir2d
	:rtype: None
") Append;
		void Append (const gp_Dir2d & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfDir2d
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfDir2d & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Dir2d
	:rtype: None
") Prepend;
		void Prepend (const gp_Dir2d & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfDir2d
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfDir2d & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Dir2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const gp_Dir2d & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfDir2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfDir2d & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Dir2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const gp_Dir2d & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfDir2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfDir2d & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfDir2d
") Split;
		Handle_TColgp_HSequenceOfDir2d Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Dir2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const gp_Dir2d & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Dir2d
") Value;
		const gp_Dir2d  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Dir2d
") ChangeValue;
		gp_Dir2d  ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfDir2d
") Sequence;
		const TColgp_SequenceOfDir2d & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfDir2d
") ChangeSequence;
		TColgp_SequenceOfDir2d & ChangeSequence ();
};


%make_alias(TColgp_HSequenceOfDir2d)

%extend TColgp_HSequenceOfDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HSequenceOfPnt;
class TColgp_HSequenceOfPnt : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HSequenceOfPnt;
		%feature("autodoc", "	:rtype: None
") TColgp_HSequenceOfPnt;
		 TColgp_HSequenceOfPnt ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Pnt
	:rtype: None
") Append;
		void Append (const gp_Pnt & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfPnt & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Pnt
	:rtype: None
") Prepend;
		void Prepend (const gp_Pnt & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfPnt & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Pnt
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const gp_Pnt & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Pnt
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const gp_Pnt & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfPnt
") Split;
		Handle_TColgp_HSequenceOfPnt Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const gp_Pnt & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Pnt
") ChangeValue;
		gp_Pnt  ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfPnt
") Sequence;
		const TColgp_SequenceOfPnt & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfPnt
") ChangeSequence;
		TColgp_SequenceOfPnt & ChangeSequence ();
};


%make_alias(TColgp_HSequenceOfPnt)

%extend TColgp_HSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HSequenceOfPnt2d;
class TColgp_HSequenceOfPnt2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HSequenceOfPnt2d;
		%feature("autodoc", "	:rtype: None
") TColgp_HSequenceOfPnt2d;
		 TColgp_HSequenceOfPnt2d ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Pnt2d
	:rtype: None
") Append;
		void Append (const gp_Pnt2d & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfPnt2d
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfPnt2d & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Pnt2d
	:rtype: None
") Prepend;
		void Prepend (const gp_Pnt2d & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfPnt2d
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfPnt2d & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Pnt2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const gp_Pnt2d & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfPnt2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt2d & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Pnt2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const gp_Pnt2d & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfPnt2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt2d & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfPnt2d
") Split;
		Handle_TColgp_HSequenceOfPnt2d Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Pnt2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const gp_Pnt2d & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Pnt2d
") ChangeValue;
		gp_Pnt2d  ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfPnt2d
") Sequence;
		const TColgp_SequenceOfPnt2d & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfPnt2d
") ChangeSequence;
		TColgp_SequenceOfPnt2d & ChangeSequence ();
};


%make_alias(TColgp_HSequenceOfPnt2d)

%extend TColgp_HSequenceOfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HSequenceOfVec;
class TColgp_HSequenceOfVec : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HSequenceOfVec;
		%feature("autodoc", "	:rtype: None
") TColgp_HSequenceOfVec;
		 TColgp_HSequenceOfVec ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Vec
	:rtype: None
") Append;
		void Append (const gp_Vec & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfVec
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfVec & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Vec
	:rtype: None
") Prepend;
		void Prepend (const gp_Vec & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfVec
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfVec & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Vec
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const gp_Vec & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfVec
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfVec & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Vec
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const gp_Vec & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfVec
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfVec & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfVec
") Split;
		Handle_TColgp_HSequenceOfVec Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Vec
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const gp_Vec & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Vec
") Value;
		const gp_Vec  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Vec
") ChangeValue;
		gp_Vec  ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfVec
") Sequence;
		const TColgp_SequenceOfVec & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfVec
") ChangeSequence;
		TColgp_SequenceOfVec & ChangeSequence ();
};


%make_alias(TColgp_HSequenceOfVec)

%extend TColgp_HSequenceOfVec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HSequenceOfVec2d;
class TColgp_HSequenceOfVec2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HSequenceOfVec2d;
		%feature("autodoc", "	:rtype: None
") TColgp_HSequenceOfVec2d;
		 TColgp_HSequenceOfVec2d ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Vec2d
	:rtype: None
") Append;
		void Append (const gp_Vec2d & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfVec2d
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfVec2d & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_Vec2d
	:rtype: None
") Prepend;
		void Prepend (const gp_Vec2d & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfVec2d
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfVec2d & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Vec2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const gp_Vec2d & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfVec2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfVec2d & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Vec2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const gp_Vec2d & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfVec2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfVec2d & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfVec2d
") Split;
		Handle_TColgp_HSequenceOfVec2d Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const gp_Vec2d & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Vec2d
") Value;
		const gp_Vec2d  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_Vec2d
") ChangeValue;
		gp_Vec2d  ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfVec2d
") Sequence;
		const TColgp_SequenceOfVec2d & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfVec2d
") ChangeSequence;
		TColgp_SequenceOfVec2d & ChangeSequence ();
};


%make_alias(TColgp_HSequenceOfVec2d)

%extend TColgp_HSequenceOfVec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HSequenceOfXY;
class TColgp_HSequenceOfXY : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HSequenceOfXY;
		%feature("autodoc", "	:rtype: None
") TColgp_HSequenceOfXY;
		 TColgp_HSequenceOfXY ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_XY
	:rtype: None
") Append;
		void Append (const gp_XY & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfXY
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfXY & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_XY
	:rtype: None
") Prepend;
		void Prepend (const gp_XY & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfXY
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfXY & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_XY
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const gp_XY & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfXY
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfXY & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_XY
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const gp_XY & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfXY
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfXY & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfXY
") Split;
		Handle_TColgp_HSequenceOfXY Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_XY
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const gp_XY & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_XY
") Value;
		const gp_XY  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_XY
") ChangeValue;
		gp_XY  ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfXY
") Sequence;
		const TColgp_SequenceOfXY & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfXY
") ChangeSequence;
		TColgp_SequenceOfXY & ChangeSequence ();
};


%make_alias(TColgp_HSequenceOfXY)

%extend TColgp_HSequenceOfXY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_HSequenceOfXYZ;
class TColgp_HSequenceOfXYZ : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColgp_HSequenceOfXYZ;
		%feature("autodoc", "	:rtype: None
") TColgp_HSequenceOfXYZ;
		 TColgp_HSequenceOfXYZ ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_XYZ
	:rtype: None
") Append;
		void Append (const gp_XYZ & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfXYZ
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfXYZ & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: gp_XYZ
	:rtype: None
") Prepend;
		void Prepend (const gp_XYZ & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfXYZ
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfXYZ & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_XYZ
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const gp_XYZ & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfXYZ
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfXYZ & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_XYZ
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const gp_XYZ & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColgp_HSequenceOfXYZ
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfXYZ & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfXYZ
") Split;
		Handle_TColgp_HSequenceOfXYZ Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: gp_XYZ
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const gp_XYZ & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_XYZ
") Value;
		const gp_XYZ  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: gp_XYZ
") ChangeValue;
		gp_XYZ  ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfXYZ
") Sequence;
		const TColgp_SequenceOfXYZ & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfXYZ
") ChangeSequence;
		TColgp_SequenceOfXYZ & ChangeSequence ();
};


%make_alias(TColgp_HSequenceOfXYZ)

%extend TColgp_HSequenceOfXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d;
class TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d;
		%feature("autodoc", "	:param I:
	:type I: Handle_TColgp_HArray1OfPnt2d
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d;
		 TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d (const Handle_TColgp_HArray1OfPnt2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt2d
") Value;
		Handle_TColgp_HArray1OfPnt2d Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d)


%extend TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfAx1;
class TColgp_SequenceNodeOfSequenceOfAx1 : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfAx1;
		%feature("autodoc", "	:param I:
	:type I: gp_Ax1
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfAx1;
		 TColgp_SequenceNodeOfSequenceOfAx1 (const gp_Ax1 & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Ax1
") Value;
		gp_Ax1  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfAx1)

%extend TColgp_SequenceNodeOfSequenceOfAx1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfDir;
class TColgp_SequenceNodeOfSequenceOfDir : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfDir;
		%feature("autodoc", "	:param I:
	:type I: gp_Dir
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfDir;
		 TColgp_SequenceNodeOfSequenceOfDir (const gp_Dir & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Dir
") Value;
		gp_Dir  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfDir)

%extend TColgp_SequenceNodeOfSequenceOfDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfDir2d;
class TColgp_SequenceNodeOfSequenceOfDir2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfDir2d;
		%feature("autodoc", "	:param I:
	:type I: gp_Dir2d
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfDir2d;
		 TColgp_SequenceNodeOfSequenceOfDir2d (const gp_Dir2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Value;
		gp_Dir2d  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfDir2d)

%extend TColgp_SequenceNodeOfSequenceOfDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfPnt;
class TColgp_SequenceNodeOfSequenceOfPnt : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfPnt;
		%feature("autodoc", "	:param I:
	:type I: gp_Pnt
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfPnt;
		 TColgp_SequenceNodeOfSequenceOfPnt (const gp_Pnt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		gp_Pnt  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfPnt)

%extend TColgp_SequenceNodeOfSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfPnt2d;
class TColgp_SequenceNodeOfSequenceOfPnt2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfPnt2d;
		%feature("autodoc", "	:param I:
	:type I: gp_Pnt2d
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfPnt2d;
		 TColgp_SequenceNodeOfSequenceOfPnt2d (const gp_Pnt2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfPnt2d)

%extend TColgp_SequenceNodeOfSequenceOfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfVec;
class TColgp_SequenceNodeOfSequenceOfVec : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfVec;
		%feature("autodoc", "	:param I:
	:type I: gp_Vec
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfVec;
		 TColgp_SequenceNodeOfSequenceOfVec (const gp_Vec & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Vec
") Value;
		gp_Vec  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfVec)

%extend TColgp_SequenceNodeOfSequenceOfVec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfVec2d;
class TColgp_SequenceNodeOfSequenceOfVec2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfVec2d;
		%feature("autodoc", "	:param I:
	:type I: gp_Vec2d
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfVec2d;
		 TColgp_SequenceNodeOfSequenceOfVec2d (const gp_Vec2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Value;
		gp_Vec2d  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfVec2d)

%extend TColgp_SequenceNodeOfSequenceOfVec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfXY;
class TColgp_SequenceNodeOfSequenceOfXY : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfXY;
		%feature("autodoc", "	:param I:
	:type I: gp_XY
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfXY;
		 TColgp_SequenceNodeOfSequenceOfXY (const gp_XY & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_XY
") Value;
		gp_XY  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfXY)

%extend TColgp_SequenceNodeOfSequenceOfXY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceNodeOfSequenceOfXYZ;
class TColgp_SequenceNodeOfSequenceOfXYZ : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColgp_SequenceNodeOfSequenceOfXYZ;
		%feature("autodoc", "	:param I:
	:type I: gp_XYZ
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColgp_SequenceNodeOfSequenceOfXYZ;
		 TColgp_SequenceNodeOfSequenceOfXYZ (const gp_XYZ & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_XYZ
") Value;
		gp_XYZ  Value ();
};


%make_alias(TColgp_SequenceNodeOfSequenceOfXYZ)

%extend TColgp_SequenceNodeOfSequenceOfXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfArray1OfPnt2d;
class TColgp_SequenceOfArray1OfPnt2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfArray1OfPnt2d;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfArray1OfPnt2d;
		 TColgp_SequenceOfArray1OfPnt2d ();
		%feature("compactdefaultargs") TColgp_SequenceOfArray1OfPnt2d;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfArray1OfPnt2d
	:rtype: None
") TColgp_SequenceOfArray1OfPnt2d;
		 TColgp_SequenceOfArray1OfPnt2d (const TColgp_SequenceOfArray1OfPnt2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfArray1OfPnt2d
	:rtype: TColgp_SequenceOfArray1OfPnt2d
") Assign;
		const TColgp_SequenceOfArray1OfPnt2d & Assign (const TColgp_SequenceOfArray1OfPnt2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfArray1OfPnt2d
	:rtype: TColgp_SequenceOfArray1OfPnt2d
") operator =;
		const TColgp_SequenceOfArray1OfPnt2d & operator = (const TColgp_SequenceOfArray1OfPnt2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TColgp_HArray1OfPnt2d
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HArray1OfPnt2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfArray1OfPnt2d
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfArray1OfPnt2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TColgp_HArray1OfPnt2d
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HArray1OfPnt2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfArray1OfPnt2d
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfArray1OfPnt2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TColgp_HArray1OfPnt2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfArray1OfPnt2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfArray1OfPnt2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TColgp_HArray1OfPnt2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfArray1OfPnt2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfArray1OfPnt2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt2d
") First;
		Handle_TColgp_HArray1OfPnt2d First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt2d
") Last;
		Handle_TColgp_HArray1OfPnt2d Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfArray1OfPnt2d
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfArray1OfPnt2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TColgp_HArray1OfPnt2d
") Value;
		Handle_TColgp_HArray1OfPnt2d Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TColgp_HArray1OfPnt2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TColgp_HArray1OfPnt2d
") ChangeValue;
		Handle_TColgp_HArray1OfPnt2d ChangeValue (const Standard_Integer Index);
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



%extend TColgp_SequenceOfArray1OfPnt2d {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TColgp_SequenceOfArray1OfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfAx1;
class TColgp_SequenceOfAx1 : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfAx1;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfAx1;
		 TColgp_SequenceOfAx1 ();
		%feature("compactdefaultargs") TColgp_SequenceOfAx1;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfAx1
	:rtype: None
") TColgp_SequenceOfAx1;
		 TColgp_SequenceOfAx1 (const TColgp_SequenceOfAx1 & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfAx1
	:rtype: TColgp_SequenceOfAx1
") Assign;
		const TColgp_SequenceOfAx1 & Assign (const TColgp_SequenceOfAx1 & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfAx1
	:rtype: TColgp_SequenceOfAx1
") operator =;
		const TColgp_SequenceOfAx1 & operator = (const TColgp_SequenceOfAx1 & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_Ax1
	:rtype: None
") Append;
		void Append (const gp_Ax1 & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfAx1
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfAx1 & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_Ax1
	:rtype: None
") Prepend;
		void Prepend (const gp_Ax1 & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfAx1
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfAx1 & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Ax1
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Ax1 & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfAx1
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfAx1 & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Ax1
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Ax1 & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfAx1
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfAx1 & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_Ax1
") First;
		const gp_Ax1  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_Ax1
") Last;
		const gp_Ax1  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfAx1
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfAx1 & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Ax1
") Value;
		const gp_Ax1  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_Ax1
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Ax1 & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Ax1
") ChangeValue;
		gp_Ax1  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfAx1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfDir;
class TColgp_SequenceOfDir : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfDir;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfDir;
		 TColgp_SequenceOfDir ();
		%feature("compactdefaultargs") TColgp_SequenceOfDir;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfDir
	:rtype: None
") TColgp_SequenceOfDir;
		 TColgp_SequenceOfDir (const TColgp_SequenceOfDir & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfDir
	:rtype: TColgp_SequenceOfDir
") Assign;
		const TColgp_SequenceOfDir & Assign (const TColgp_SequenceOfDir & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfDir
	:rtype: TColgp_SequenceOfDir
") operator =;
		const TColgp_SequenceOfDir & operator = (const TColgp_SequenceOfDir & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_Dir
	:rtype: None
") Append;
		void Append (const gp_Dir & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfDir
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfDir & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_Dir
	:rtype: None
") Prepend;
		void Prepend (const gp_Dir & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfDir
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfDir & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Dir
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Dir & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfDir
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfDir & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Dir
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Dir & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfDir
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfDir & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_Dir
") First;
		const gp_Dir  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_Dir
") Last;
		const gp_Dir  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfDir
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfDir & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir
") Value;
		const gp_Dir  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_Dir
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Dir & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir
") ChangeValue;
		gp_Dir  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfDir2d;
class TColgp_SequenceOfDir2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfDir2d;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfDir2d;
		 TColgp_SequenceOfDir2d ();
		%feature("compactdefaultargs") TColgp_SequenceOfDir2d;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfDir2d
	:rtype: None
") TColgp_SequenceOfDir2d;
		 TColgp_SequenceOfDir2d (const TColgp_SequenceOfDir2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfDir2d
	:rtype: TColgp_SequenceOfDir2d
") Assign;
		const TColgp_SequenceOfDir2d & Assign (const TColgp_SequenceOfDir2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfDir2d
	:rtype: TColgp_SequenceOfDir2d
") operator =;
		const TColgp_SequenceOfDir2d & operator = (const TColgp_SequenceOfDir2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_Dir2d
	:rtype: None
") Append;
		void Append (const gp_Dir2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfDir2d
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfDir2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_Dir2d
	:rtype: None
") Prepend;
		void Prepend (const gp_Dir2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfDir2d
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfDir2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Dir2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Dir2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfDir2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfDir2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Dir2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Dir2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfDir2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfDir2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_Dir2d
") First;
		const gp_Dir2d  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Last;
		const gp_Dir2d  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfDir2d
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfDir2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir2d
") Value;
		const gp_Dir2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_Dir2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Dir2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Dir2d
") ChangeValue;
		gp_Dir2d  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfPnt;
class TColgp_SequenceOfPnt : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfPnt;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfPnt;
		 TColgp_SequenceOfPnt ();
		%feature("compactdefaultargs") TColgp_SequenceOfPnt;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfPnt
	:rtype: None
") TColgp_SequenceOfPnt;
		 TColgp_SequenceOfPnt (const TColgp_SequenceOfPnt & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfPnt
	:rtype: TColgp_SequenceOfPnt
") Assign;
		const TColgp_SequenceOfPnt & Assign (const TColgp_SequenceOfPnt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfPnt
	:rtype: TColgp_SequenceOfPnt
") operator =;
		const TColgp_SequenceOfPnt & operator = (const TColgp_SequenceOfPnt & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_Pnt
	:rtype: None
") Append;
		void Append (const gp_Pnt & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfPnt
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfPnt & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_Pnt
	:rtype: None
") Prepend;
		void Prepend (const gp_Pnt & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfPnt
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfPnt & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Pnt
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Pnt & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfPnt
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfPnt & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Pnt
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Pnt & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfPnt
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfPnt & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_Pnt
") First;
		const gp_Pnt  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_Pnt
") Last;
		const gp_Pnt  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfPnt
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfPnt & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Pnt & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") ChangeValue;
		gp_Pnt  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfPnt2d;
class TColgp_SequenceOfPnt2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfPnt2d;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfPnt2d;
		 TColgp_SequenceOfPnt2d ();
		%feature("compactdefaultargs") TColgp_SequenceOfPnt2d;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfPnt2d
	:rtype: None
") TColgp_SequenceOfPnt2d;
		 TColgp_SequenceOfPnt2d (const TColgp_SequenceOfPnt2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfPnt2d
	:rtype: TColgp_SequenceOfPnt2d
") Assign;
		const TColgp_SequenceOfPnt2d & Assign (const TColgp_SequenceOfPnt2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfPnt2d
	:rtype: TColgp_SequenceOfPnt2d
") operator =;
		const TColgp_SequenceOfPnt2d & operator = (const TColgp_SequenceOfPnt2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_Pnt2d
	:rtype: None
") Append;
		void Append (const gp_Pnt2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfPnt2d
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfPnt2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_Pnt2d
	:rtype: None
") Prepend;
		void Prepend (const gp_Pnt2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfPnt2d
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfPnt2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Pnt2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Pnt2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfPnt2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfPnt2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Pnt2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Pnt2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfPnt2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfPnt2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") First;
		const gp_Pnt2d  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Last;
		const gp_Pnt2d  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfPnt2d
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfPnt2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_Pnt2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Pnt2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") ChangeValue;
		gp_Pnt2d  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfPnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfVec;
class TColgp_SequenceOfVec : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfVec;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfVec;
		 TColgp_SequenceOfVec ();
		%feature("compactdefaultargs") TColgp_SequenceOfVec;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfVec
	:rtype: None
") TColgp_SequenceOfVec;
		 TColgp_SequenceOfVec (const TColgp_SequenceOfVec & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfVec
	:rtype: TColgp_SequenceOfVec
") Assign;
		const TColgp_SequenceOfVec & Assign (const TColgp_SequenceOfVec & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfVec
	:rtype: TColgp_SequenceOfVec
") operator =;
		const TColgp_SequenceOfVec & operator = (const TColgp_SequenceOfVec & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_Vec
	:rtype: None
") Append;
		void Append (const gp_Vec & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfVec
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfVec & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_Vec
	:rtype: None
") Prepend;
		void Prepend (const gp_Vec & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfVec
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfVec & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Vec
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Vec & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfVec
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfVec & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Vec
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Vec & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfVec
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfVec & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_Vec
") First;
		const gp_Vec  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_Vec
") Last;
		const gp_Vec  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfVec
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfVec & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec
") Value;
		const gp_Vec  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_Vec
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Vec & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec
") ChangeValue;
		gp_Vec  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfVec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfVec2d;
class TColgp_SequenceOfVec2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfVec2d;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfVec2d;
		 TColgp_SequenceOfVec2d ();
		%feature("compactdefaultargs") TColgp_SequenceOfVec2d;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfVec2d
	:rtype: None
") TColgp_SequenceOfVec2d;
		 TColgp_SequenceOfVec2d (const TColgp_SequenceOfVec2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfVec2d
	:rtype: TColgp_SequenceOfVec2d
") Assign;
		const TColgp_SequenceOfVec2d & Assign (const TColgp_SequenceOfVec2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfVec2d
	:rtype: TColgp_SequenceOfVec2d
") operator =;
		const TColgp_SequenceOfVec2d & operator = (const TColgp_SequenceOfVec2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_Vec2d
	:rtype: None
") Append;
		void Append (const gp_Vec2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfVec2d
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfVec2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_Vec2d
	:rtype: None
") Prepend;
		void Prepend (const gp_Vec2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfVec2d
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfVec2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Vec2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Vec2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfVec2d
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfVec2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_Vec2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Vec2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfVec2d
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfVec2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_Vec2d
") First;
		const gp_Vec2d  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Last;
		const gp_Vec2d  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfVec2d
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfVec2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec2d
") Value;
		const gp_Vec2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Vec2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Vec2d
") ChangeValue;
		gp_Vec2d  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfVec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfXY;
class TColgp_SequenceOfXY : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfXY;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfXY;
		 TColgp_SequenceOfXY ();
		%feature("compactdefaultargs") TColgp_SequenceOfXY;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfXY
	:rtype: None
") TColgp_SequenceOfXY;
		 TColgp_SequenceOfXY (const TColgp_SequenceOfXY & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfXY
	:rtype: TColgp_SequenceOfXY
") Assign;
		const TColgp_SequenceOfXY & Assign (const TColgp_SequenceOfXY & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfXY
	:rtype: TColgp_SequenceOfXY
") operator =;
		const TColgp_SequenceOfXY & operator = (const TColgp_SequenceOfXY & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_XY
	:rtype: None
") Append;
		void Append (const gp_XY & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfXY
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfXY & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_XY
	:rtype: None
") Prepend;
		void Prepend (const gp_XY & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfXY
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfXY & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_XY
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_XY & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfXY
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfXY & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_XY
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_XY & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfXY
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfXY & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_XY
") First;
		const gp_XY  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_XY
") Last;
		const gp_XY  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfXY
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfXY & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XY
") Value;
		const gp_XY  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_XY
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_XY & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XY
") ChangeValue;
		gp_XY  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfXY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColgp_SequenceOfXYZ;
class TColgp_SequenceOfXYZ : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColgp_SequenceOfXYZ;
		%feature("autodoc", "	:rtype: None
") TColgp_SequenceOfXYZ;
		 TColgp_SequenceOfXYZ ();
		%feature("compactdefaultargs") TColgp_SequenceOfXYZ;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfXYZ
	:rtype: None
") TColgp_SequenceOfXYZ;
		 TColgp_SequenceOfXYZ (const TColgp_SequenceOfXYZ & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfXYZ
	:rtype: TColgp_SequenceOfXYZ
") Assign;
		const TColgp_SequenceOfXYZ & Assign (const TColgp_SequenceOfXYZ & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColgp_SequenceOfXYZ
	:rtype: TColgp_SequenceOfXYZ
") operator =;
		const TColgp_SequenceOfXYZ & operator = (const TColgp_SequenceOfXYZ & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: gp_XYZ
	:rtype: None
") Append;
		void Append (const gp_XYZ & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfXYZ
	:rtype: None
") Append;
		void Append (TColgp_SequenceOfXYZ & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: gp_XYZ
	:rtype: None
") Prepend;
		void Prepend (const gp_XYZ & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColgp_SequenceOfXYZ
	:rtype: None
") Prepend;
		void Prepend (TColgp_SequenceOfXYZ & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_XYZ
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_XYZ & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfXYZ
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColgp_SequenceOfXYZ & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: gp_XYZ
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_XYZ & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColgp_SequenceOfXYZ
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColgp_SequenceOfXYZ & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: gp_XYZ
") First;
		const gp_XYZ  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: gp_XYZ
") Last;
		const gp_XYZ  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColgp_SequenceOfXYZ
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColgp_SequenceOfXYZ & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XYZ
") Value;
		const gp_XYZ  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: gp_XYZ
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_XYZ & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_XYZ
") ChangeValue;
		gp_XYZ  ChangeValue (const Standard_Integer Index);
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


%extend TColgp_SequenceOfXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
