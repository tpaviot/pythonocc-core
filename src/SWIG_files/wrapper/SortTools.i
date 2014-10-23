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
%module (package="OCC") SortTools

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

%include SortTools_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor SortTools_HeapSortOfInteger;
class SortTools_HeapSortOfInteger {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: TCollection_CompareOfInteger &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const TCollection_CompareOfInteger & Comp);
};


%feature("shadow") SortTools_HeapSortOfInteger::~SortTools_HeapSortOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SortTools_HeapSortOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SortTools_HeapSortOfReal;
class SortTools_HeapSortOfReal {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfReal &
	:param Comp:
	:type Comp: TCollection_CompareOfReal &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfReal & TheArray,const TCollection_CompareOfReal & Comp);
};


%feature("shadow") SortTools_HeapSortOfReal::~SortTools_HeapSortOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SortTools_HeapSortOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SortTools_QuickSortOfInteger;
class SortTools_QuickSortOfInteger {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: TCollection_CompareOfInteger &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const TCollection_CompareOfInteger & Comp);
};


%feature("shadow") SortTools_QuickSortOfInteger::~SortTools_QuickSortOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SortTools_QuickSortOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SortTools_QuickSortOfReal;
class SortTools_QuickSortOfReal {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfReal &
	:param Comp:
	:type Comp: TCollection_CompareOfReal &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfReal & TheArray,const TCollection_CompareOfReal & Comp);
};


%feature("shadow") SortTools_QuickSortOfReal::~SortTools_QuickSortOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SortTools_QuickSortOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SortTools_ShellSortOfInteger;
class SortTools_ShellSortOfInteger {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: TCollection_CompareOfInteger &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const TCollection_CompareOfInteger & Comp);
};


%feature("shadow") SortTools_ShellSortOfInteger::~SortTools_ShellSortOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SortTools_ShellSortOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SortTools_ShellSortOfReal;
class SortTools_ShellSortOfReal {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfReal &
	:param Comp:
	:type Comp: TCollection_CompareOfReal &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfReal & TheArray,const TCollection_CompareOfReal & Comp);
};


%feature("shadow") SortTools_ShellSortOfReal::~SortTools_ShellSortOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SortTools_ShellSortOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SortTools_StraightInsertionSortOfInteger;
class SortTools_StraightInsertionSortOfInteger {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: TCollection_CompareOfInteger &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const TCollection_CompareOfInteger & Comp);
};


%feature("shadow") SortTools_StraightInsertionSortOfInteger::~SortTools_StraightInsertionSortOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SortTools_StraightInsertionSortOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SortTools_StraightInsertionSortOfReal;
class SortTools_StraightInsertionSortOfReal {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfReal &
	:param Comp:
	:type Comp: TCollection_CompareOfReal &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfReal & TheArray,const TCollection_CompareOfReal & Comp);
};


%feature("shadow") SortTools_StraightInsertionSortOfReal::~SortTools_StraightInsertionSortOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SortTools_StraightInsertionSortOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
