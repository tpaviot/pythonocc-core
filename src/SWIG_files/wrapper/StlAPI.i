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
%module StlAPI

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

%include StlAPI_required_python_modules.i
%include StlAPI_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(stlapi) StlAPI;
%nodefaultctor StlAPI;
class StlAPI {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aFile(char *)
	aAsciiMode(Standard_Boolean)=Standard_True

Returns:
	static void

Convert and write shape to STL format.  
        file is written in binary if aAsciiMode is False  
        otherwise it is written in Ascii (by default)") Write;
		static void Write (const TopoDS_Shape & aShape,const char * aFile,const Standard_Boolean aAsciiMode = Standard_True);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aFile(char *)

Returns:
	static void

Create a shape from a STL format.") Read;
		static void Read (TopoDS_Shape & aShape,const char * aFile);
};


%feature("shadow") StlAPI::~StlAPI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlAPI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor StlAPI_Reader;
class StlAPI_Reader {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") StlAPI_Reader;
		 StlAPI_Reader ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aFileName(char *)

Returns:
	None

No detailed docstring for this function.") Read;
		void Read (TopoDS_Shape & aShape,const char * aFileName);
};


%feature("shadow") StlAPI_Reader::~StlAPI_Reader %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlAPI_Reader {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor StlAPI_Writer;
class StlAPI_Writer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a writer object with  
default parameters: ASCIIMode, RelativeMode, SetCoefficent,  
SetDeflection. These parameters may be modified.") StlAPI_Writer;
		 StlAPI_Writer ();
		%feature("autodoc", "Args:
	aDeflection(Standard_Real)

Returns:
	None

Sets the deflection of the meshing algorithm.  
   Deflection is used, only if relative mode is false") SetDeflection;
		void SetDeflection (const Standard_Real aDeflection);
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	None

Sets the coeffiecient for computation of deflection through  
         relative size of shape. Default value = 0.001") SetCoefficient;
		void SetCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the address to the  
flag defining the relative mode for writing the file.  
This address may be used to either read or change the flag.  
If the mode returns True (default value), the  
deflection is calculated from the relative size of the  
shape. If the mode returns False, the user defined deflection is used.  
Example  
Read:  
Standard_Boolean val = Writer.RelativeMode( );  
Modify:  
Writer.RelativeMode( ) = Standard_True;") RelativeMode;
		Standard_Boolean & RelativeMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the address to the  
flag defining the mode for writing the file. This address  
may be used to either read or change the flag.  
If the mode returns True (default value) the generated  
file is an ASCII file. If the mode returns False, the  
generated file is a binary file.") ASCIIMode;
		Standard_Boolean & ASCIIMode ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aFileName(char *)
	InParallel(Standard_Boolean)=Standard_False

Returns:
	None

Converts a given shape to STL format and writes it to file with a given filename.") Write;
		void Write (const TopoDS_Shape & aShape,const char * aFileName,const Standard_Boolean InParallel = Standard_False);
};


%feature("shadow") StlAPI_Writer::~StlAPI_Writer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlAPI_Writer {
	void _kill_pointed() {
		delete $self;
	}
};
