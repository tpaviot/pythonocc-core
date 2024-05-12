/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOMTOOLSDOCSTRING
"GeomTools module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_geomtools.html"
%enddef
%module (package="OCC.Core", docstring=GEOMTOOLSDOCSTRING) GeomTools


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
#include<GeomTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Geom2d.i
%import Message.i

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
%wrap_handle(GeomTools_UndefinedTypeHandler)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class GeomTools *
******************/
%rename(geomtools) GeomTools;
class GeomTools {
	public:
		/****************** Dump ******************/
		/**** md5 signature: 3a6cd44b2ef16268d7f58b9b7270cde3 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
OS: Standard_OStream

Description
-----------
A set of curves from geom2d. dumps the surface on the stream.
") Dump;
		static void Dump(const opencascade::handle<Geom_Surface> & S, std::ostream &OutValue);

		/****************** Dump ******************/
		/**** md5 signature: 20c6add2ce10d173c8b9bb0b25454934 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the curve on the stream.
") Dump;
		static void Dump(const opencascade::handle<Geom_Curve> & C, std::ostream &OutValue);

		/****************** Dump ******************/
		/**** md5 signature: 9175efaa435a7d1386eb4799ecf3c40c ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the curve on the stream.
") Dump;
		static void Dump(const opencascade::handle<Geom2d_Curve> & C, std::ostream &OutValue);

		/****************** GetReal ******************/
		/**** md5 signature: c50fd53b89ec2e186f253d0a770a36c5 ****/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
theValue: float

Description
-----------
Reads the standard_real value from the stream. zero is read in case of error.
") GetReal;
		static void GetReal(std::istream & IS, Standard_Real &OutValue);

		/****************** GetUndefinedTypeHandler ******************/
		/**** md5 signature: 4feeff4a1f6ab5a12fb2effedf9bc1c3 ****/
		%feature("compactdefaultargs") GetUndefinedTypeHandler;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomTools_UndefinedTypeHandler>

Description
-----------
No available documentation.
") GetUndefinedTypeHandler;
		static opencascade::handle<GeomTools_UndefinedTypeHandler> GetUndefinedTypeHandler();

		/****************** Read ******************/
		/**** md5 signature: 191d80cccc353bbf07985fe0caac76a3 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
IS: str

Return
-------
None

Description
-----------
Reads the surface from the stream.
") Read;
		static void Read(opencascade::handle<Geom_Surface> & S, std::istream & IS);

		/****************** Read ******************/
		/**** md5 signature: 43eb96c4a0f249b2667438b2ff88caea ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
IS: str

Return
-------
None

Description
-----------
Reads the curve from the stream.
") Read;
		static void Read(opencascade::handle<Geom_Curve> & C, std::istream & IS);

		/****************** Read ******************/
		/**** md5 signature: 79ef9bb82a3316be119a2083f299bda0 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
IS: str

Return
-------
None

Description
-----------
Reads the curve from the stream.
") Read;
		static void Read(opencascade::handle<Geom2d_Curve> & C, std::istream & IS);

		/****************** SetUndefinedTypeHandler ******************/
		/**** md5 signature: 924bb9ac20d7bc97a8eee36d4f9f3c0b ****/
		%feature("compactdefaultargs") SetUndefinedTypeHandler;
		%feature("autodoc", "
Parameters
----------
aHandler: GeomTools_UndefinedTypeHandler

Return
-------
None

Description
-----------
No available documentation.
") SetUndefinedTypeHandler;
		static void SetUndefinedTypeHandler(const opencascade::handle<GeomTools_UndefinedTypeHandler> & aHandler);

		/****************** Write ******************/
		/**** md5 signature: b224a56a31c778e86a088ef67369cbeb ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
OS: Standard_OStream

Description
-----------
Writes the surface on the stream.
") Write;
		static void Write(const opencascade::handle<Geom_Surface> & S, std::ostream &OutValue);

		/****************** Write ******************/
		/**** md5 signature: 5fef400262c9232ed45a679c8f37278e ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
OS: Standard_OStream

Description
-----------
Writes the curve on the stream.
") Write;
		static void Write(const opencascade::handle<Geom_Curve> & C, std::ostream &OutValue);

		/****************** Write ******************/
		/**** md5 signature: 1496e488409705f4e06b0e25cc3dde78 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
OS: Standard_OStream

Description
-----------
Writes the curve on the stream.
") Write;
		static void Write(const opencascade::handle<Geom2d_Curve> & C, std::ostream &OutValue);

};


%extend GeomTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomTools_Curve2dSet *
*****************************/
class GeomTools_Curve2dSet {
	public:
		/****************** GeomTools_Curve2dSet ******************/
		/**** md5 signature: fd1845b0ee77ab29f7ca4ee6ff8d9279 ****/
		%feature("compactdefaultargs") GeomTools_Curve2dSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of curves.
") GeomTools_Curve2dSet;
		 GeomTools_Curve2dSet();

		/****************** Add ******************/
		/**** md5 signature: 947264273ed6b5c72eac1f308b1f2487 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
int

Description
-----------
Incorporate a new curve in the set and returns its index.
") Add;
		Standard_Integer Add(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****************** Curve2d ******************/
		/**** md5 signature: aca04b75893a006fca996d6d157d858d ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns the curve of index <i>.
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d(const Standard_Integer I);

		/****************** Dump ******************/
		/**** md5 signature: e60d722f65a7811be636699da7600e78 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the content of me on the stream <os>.
") Dump;
		void Dump(std::ostream &OutValue);

		/****************** Index ******************/
		/**** md5 signature: e1559320ddf80ce0263d324c781a3407 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
int

Description
-----------
Returns the index of <l>.
") Index;
		Standard_Integer Index(const opencascade::handle<Geom2d_Curve> & C);

		/****************** PrintCurve2d ******************/
		/**** md5 signature: ffcee85cd663bb79253e2d08e26c9b19 ****/
		%feature("compactdefaultargs") PrintCurve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
compact: bool (optional, default to Standard_False)

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the curve on the stream, if compact is true use the compact format that can be read back.
") PrintCurve2d;
		static void PrintCurve2d(const opencascade::handle<Geom2d_Curve> & C, std::ostream &OutValue, const Standard_Boolean compact = Standard_False);

		/****************** Read ******************/
		/**** md5 signature: e5ce096318e6663d7e9f744e8d66b70b ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the stream <is>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadCurve2d ******************/
		/**** md5 signature: 5d3b82b1ffef248fe3d83a98f1b80a19 ****/
		%feature("compactdefaultargs") ReadCurve2d;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Reads the curve from the stream. the curve is assumed to have been written with the print method (compact = true).
") ReadCurve2d;
		static opencascade::handle<Geom2d_Curve> ReadCurve2d(std::istream & IS);

		/****************** Write ******************/
		/**** md5 signature: 6a95f1af9efa3b2eec48861a606241ee ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in a format that can be read back by read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend GeomTools_Curve2dSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomTools_CurveSet *
***************************/
class GeomTools_CurveSet {
	public:
		/****************** GeomTools_CurveSet ******************/
		/**** md5 signature: db7c2b276941a40dfd1eecce0ab38615 ****/
		%feature("compactdefaultargs") GeomTools_CurveSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of curves.
") GeomTools_CurveSet;
		 GeomTools_CurveSet();

		/****************** Add ******************/
		/**** md5 signature: 4548eacacd2a36c829559b37d6b57411 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
int

Description
-----------
Incorporate a new curve in the set and returns its index.
") Add;
		Standard_Integer Add(const opencascade::handle<Geom_Curve> & C);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****************** Curve ******************/
		/**** md5 signature: 3509a433898cb7510761da8b37eedb3b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the curve of index <i>.
") Curve;
		opencascade::handle<Geom_Curve> Curve(const Standard_Integer I);

		/****************** Dump ******************/
		/**** md5 signature: e60d722f65a7811be636699da7600e78 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the content of me on the stream <os>.
") Dump;
		void Dump(std::ostream &OutValue);

		/****************** Index ******************/
		/**** md5 signature: c53cbf4d0efdfb90843e67e9b32c5252 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
int

Description
-----------
Returns the index of <l>.
") Index;
		Standard_Integer Index(const opencascade::handle<Geom_Curve> & C);

		/****************** PrintCurve ******************/
		/**** md5 signature: 9cb5308983a4ee0a89defb9c26e1cdb3 ****/
		%feature("compactdefaultargs") PrintCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
compact: bool (optional, default to Standard_False)

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the curve on the stream, if compact is true use the compact format that can be read back.
") PrintCurve;
		static void PrintCurve(const opencascade::handle<Geom_Curve> & C, std::ostream &OutValue, const Standard_Boolean compact = Standard_False);

		/****************** Read ******************/
		/**** md5 signature: e5ce096318e6663d7e9f744e8d66b70b ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the stream <is>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadCurve ******************/
		/**** md5 signature: 7beb4c6e38ccc7af597e9d8bc17c7088 ****/
		%feature("compactdefaultargs") ReadCurve;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Reads the curve from the stream. the curve is assumed to have been written with the print method (compact = true).
") ReadCurve;
		static opencascade::handle<Geom_Curve> ReadCurve(std::istream & IS);

		/****************** Write ******************/
		/**** md5 signature: 6a95f1af9efa3b2eec48861a606241ee ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in a format that can be read back by read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend GeomTools_CurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomTools_SurfaceSet *
*****************************/
class GeomTools_SurfaceSet {
	public:
		/****************** GeomTools_SurfaceSet ******************/
		/**** md5 signature: 13978194ee9f9c91ee7a81cdf7063dc2 ****/
		%feature("compactdefaultargs") GeomTools_SurfaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of surfaces.
") GeomTools_SurfaceSet;
		 GeomTools_SurfaceSet();

		/****************** Add ******************/
		/**** md5 signature: 6108c9acf8995214a7cb8b8e5a0b937c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
int

Description
-----------
Incorporate a new surface in the set and returns its index.
") Add;
		Standard_Integer Add(const opencascade::handle<Geom_Surface> & S);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****************** Dump ******************/
		/**** md5 signature: e60d722f65a7811be636699da7600e78 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the content of me on the stream <os>.
") Dump;
		void Dump(std::ostream &OutValue);

		/****************** Index ******************/
		/**** md5 signature: 7fc50802d17ebd7c660284e6560fb7f6 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
int

Description
-----------
Returns the index of <l>.
") Index;
		Standard_Integer Index(const opencascade::handle<Geom_Surface> & S);

		/****************** PrintSurface ******************/
		/**** md5 signature: f03cd58b0fc54c8e16b1b9c3619b768f ****/
		%feature("compactdefaultargs") PrintSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
compact: bool (optional, default to Standard_False)

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the surface on the stream, if compact is true use the compact format that can be read back.
") PrintSurface;
		static void PrintSurface(const opencascade::handle<Geom_Surface> & S, std::ostream &OutValue, const Standard_Boolean compact = Standard_False);

		/****************** Read ******************/
		/**** md5 signature: e5ce096318e6663d7e9f744e8d66b70b ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the stream <is>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadSurface ******************/
		/**** md5 signature: c678c8ab6d4fb0ee948ec3e0b84c9046 ****/
		%feature("compactdefaultargs") ReadSurface;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Reads the surface from the stream. the surface is assumed to have been written with the print method (compact = true).
") ReadSurface;
		static opencascade::handle<Geom_Surface> ReadSurface(std::istream & IS);

		/****************** Surface ******************/
		/**** md5 signature: f08a9f2a886e0a3933ae15a38f9b8dda ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the surface of index <i>.
") Surface;
		opencascade::handle<Geom_Surface> Surface(const Standard_Integer I);

		/****************** Write ******************/
		/**** md5 signature: 6a95f1af9efa3b2eec48861a606241ee ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in a format that can be read back by read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend GeomTools_SurfaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomTools_UndefinedTypeHandler *
***************************************/
class GeomTools_UndefinedTypeHandler : public Standard_Transient {
	public:
		/****************** GeomTools_UndefinedTypeHandler ******************/
		/**** md5 signature: cc90fa1e9e672821392fcca7d830ff55 ****/
		%feature("compactdefaultargs") GeomTools_UndefinedTypeHandler;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomTools_UndefinedTypeHandler;
		 GeomTools_UndefinedTypeHandler();

		/****************** PrintCurve ******************/
		/**** md5 signature: 9229a0d70724577ea967874667e632bc ****/
		%feature("compactdefaultargs") PrintCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
compact: bool (optional, default to Standard_False)

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PrintCurve;
		virtual void PrintCurve(const opencascade::handle<Geom_Curve> & C, std::ostream &OutValue, const Standard_Boolean compact = Standard_False);

		/****************** PrintCurve2d ******************/
		/**** md5 signature: 7e257c476bf0d68e904e2daed78d6479 ****/
		%feature("compactdefaultargs") PrintCurve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
compact: bool (optional, default to Standard_False)

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PrintCurve2d;
		virtual void PrintCurve2d(const opencascade::handle<Geom2d_Curve> & C, std::ostream &OutValue, const Standard_Boolean compact = Standard_False);

		/****************** PrintSurface ******************/
		/**** md5 signature: 6b4c01c323e1d0fad05dea4d7e15f780 ****/
		%feature("compactdefaultargs") PrintSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
compact: bool (optional, default to Standard_False)

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PrintSurface;
		virtual void PrintSurface(const opencascade::handle<Geom_Surface> & S, std::ostream &OutValue, const Standard_Boolean compact = Standard_False);

		/****************** ReadCurve ******************/
		/**** md5 signature: ec4aea4a5365adad6fc1b3ae7538554c ****/
		%feature("compactdefaultargs") ReadCurve;
		%feature("autodoc", "
Parameters
----------
ctype: int
IS: str
C: Geom_Curve

Return
-------
Standard_IStream

Description
-----------
No available documentation.
") ReadCurve;
		virtual Standard_IStream & ReadCurve(const Standard_Integer ctype, std::istream & IS, opencascade::handle<Geom_Curve> & C);

		/****************** ReadCurve2d ******************/
		/**** md5 signature: ad483c9803fa37d94a5a9dad7bf1987d ****/
		%feature("compactdefaultargs") ReadCurve2d;
		%feature("autodoc", "
Parameters
----------
ctype: int
IS: str
C: Geom2d_Curve

Return
-------
Standard_IStream

Description
-----------
No available documentation.
") ReadCurve2d;
		virtual Standard_IStream & ReadCurve2d(const Standard_Integer ctype, std::istream & IS, opencascade::handle<Geom2d_Curve> & C);

		/****************** ReadSurface ******************/
		/**** md5 signature: acd0062fe378bd76a7b522c9793520ec ****/
		%feature("compactdefaultargs") ReadSurface;
		%feature("autodoc", "
Parameters
----------
ctype: int
IS: str
S: Geom_Surface

Return
-------
Standard_IStream

Description
-----------
No available documentation.
") ReadSurface;
		virtual Standard_IStream & ReadSurface(const Standard_Integer ctype, std::istream & IS, opencascade::handle<Geom_Surface> & S);

};


%make_alias(GeomTools_UndefinedTypeHandler)

%extend GeomTools_UndefinedTypeHandler {
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
def geomtools_Dump(*args):
	return geomtools.Dump(*args)

@deprecated
def geomtools_Dump(*args):
	return geomtools.Dump(*args)

@deprecated
def geomtools_Dump(*args):
	return geomtools.Dump(*args)

@deprecated
def geomtools_GetReal(*args):
	return geomtools.GetReal(*args)

@deprecated
def geomtools_GetUndefinedTypeHandler(*args):
	return geomtools.GetUndefinedTypeHandler(*args)

@deprecated
def geomtools_Read(*args):
	return geomtools.Read(*args)

@deprecated
def geomtools_Read(*args):
	return geomtools.Read(*args)

@deprecated
def geomtools_Read(*args):
	return geomtools.Read(*args)

@deprecated
def geomtools_SetUndefinedTypeHandler(*args):
	return geomtools.SetUndefinedTypeHandler(*args)

@deprecated
def geomtools_Write(*args):
	return geomtools.Write(*args)

@deprecated
def geomtools_Write(*args):
	return geomtools.Write(*args)

@deprecated
def geomtools_Write(*args):
	return geomtools.Write(*args)

@deprecated
def GeomTools_Curve2dSet_PrintCurve2d(*args):
	return GeomTools_Curve2dSet.PrintCurve2d(*args)

@deprecated
def GeomTools_Curve2dSet_ReadCurve2d(*args):
	return GeomTools_Curve2dSet.ReadCurve2d(*args)

@deprecated
def GeomTools_CurveSet_PrintCurve(*args):
	return GeomTools_CurveSet.PrintCurve(*args)

@deprecated
def GeomTools_CurveSet_ReadCurve(*args):
	return GeomTools_CurveSet.ReadCurve(*args)

@deprecated
def GeomTools_SurfaceSet_PrintSurface(*args):
	return GeomTools_SurfaceSet.PrintSurface(*args)

@deprecated
def GeomTools_SurfaceSet_ReadSurface(*args):
	return GeomTools_SurfaceSet.ReadSurface(*args)

}
