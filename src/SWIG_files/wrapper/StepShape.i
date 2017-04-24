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
%module (package="OCC") StepShape

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


%include StepShape_headers.i


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
enum StepShape_AngleRelator {
	StepShape_Equal = 0,
	StepShape_Large = 1,
	StepShape_Small = 2,
};

enum StepShape_BooleanOperator {
	StepShape_boDifference = 0,
	StepShape_boIntersection = 1,
	StepShape_boUnion = 2,
};

/* end public enums declaration */

%nodefaultctor StepShape_Array1OfConnectedEdgeSet;
class StepShape_Array1OfConnectedEdgeSet {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfConnectedEdgeSet;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfConnectedEdgeSet;
		 StepShape_Array1OfConnectedEdgeSet (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfConnectedEdgeSet;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepShape_ConnectedEdgeSet &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfConnectedEdgeSet;
		 StepShape_Array1OfConnectedEdgeSet (const Handle_StepShape_ConnectedEdgeSet & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_ConnectedEdgeSet &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_ConnectedEdgeSet & V);
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
	:type Other: StepShape_Array1OfConnectedEdgeSet &
	:rtype: StepShape_Array1OfConnectedEdgeSet
") Assign;
		const StepShape_Array1OfConnectedEdgeSet & Assign (const StepShape_Array1OfConnectedEdgeSet & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfConnectedEdgeSet &
	:rtype: StepShape_Array1OfConnectedEdgeSet
") operator =;
		const StepShape_Array1OfConnectedEdgeSet & operator = (const StepShape_Array1OfConnectedEdgeSet & Other);
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
	:type Value: Handle_StepShape_ConnectedEdgeSet &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_ConnectedEdgeSet & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_ConnectedEdgeSet
") Value;
		Handle_StepShape_ConnectedEdgeSet Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_ConnectedEdgeSet
") ChangeValue;
		Handle_StepShape_ConnectedEdgeSet ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfConnectedEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfConnectedFaceSet;
class StepShape_Array1OfConnectedFaceSet {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfConnectedFaceSet;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfConnectedFaceSet;
		 StepShape_Array1OfConnectedFaceSet (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfConnectedFaceSet;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepShape_ConnectedFaceSet &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfConnectedFaceSet;
		 StepShape_Array1OfConnectedFaceSet (const Handle_StepShape_ConnectedFaceSet & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_ConnectedFaceSet & V);
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
	:type Other: StepShape_Array1OfConnectedFaceSet &
	:rtype: StepShape_Array1OfConnectedFaceSet
") Assign;
		const StepShape_Array1OfConnectedFaceSet & Assign (const StepShape_Array1OfConnectedFaceSet & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfConnectedFaceSet &
	:rtype: StepShape_Array1OfConnectedFaceSet
") operator =;
		const StepShape_Array1OfConnectedFaceSet & operator = (const StepShape_Array1OfConnectedFaceSet & Other);
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
	:type Value: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_ConnectedFaceSet & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_ConnectedFaceSet
") Value;
		Handle_StepShape_ConnectedFaceSet Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_ConnectedFaceSet
") ChangeValue;
		Handle_StepShape_ConnectedFaceSet ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfConnectedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfEdge;
class StepShape_Array1OfEdge {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfEdge;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfEdge;
		 StepShape_Array1OfEdge (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfEdge;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepShape_Edge &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfEdge;
		 StepShape_Array1OfEdge (const Handle_StepShape_Edge & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_Edge &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_Edge & V);
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
	:type Other: StepShape_Array1OfEdge &
	:rtype: StepShape_Array1OfEdge
") Assign;
		const StepShape_Array1OfEdge & Assign (const StepShape_Array1OfEdge & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfEdge &
	:rtype: StepShape_Array1OfEdge
") operator =;
		const StepShape_Array1OfEdge & operator = (const StepShape_Array1OfEdge & Other);
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
	:type Value: Handle_StepShape_Edge &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_Edge & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_Edge
") Value;
		Handle_StepShape_Edge Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_Edge
") ChangeValue;
		Handle_StepShape_Edge ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfFace;
class StepShape_Array1OfFace {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfFace;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfFace;
		 StepShape_Array1OfFace (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfFace;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepShape_Face &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfFace;
		 StepShape_Array1OfFace (const Handle_StepShape_Face & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_Face &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_Face & V);
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
	:type Other: StepShape_Array1OfFace &
	:rtype: StepShape_Array1OfFace
") Assign;
		const StepShape_Array1OfFace & Assign (const StepShape_Array1OfFace & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfFace &
	:rtype: StepShape_Array1OfFace
") operator =;
		const StepShape_Array1OfFace & operator = (const StepShape_Array1OfFace & Other);
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
	:type Value: Handle_StepShape_Face &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_Face & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_Face
") Value;
		Handle_StepShape_Face Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_Face
") ChangeValue;
		Handle_StepShape_Face ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfFaceBound;
class StepShape_Array1OfFaceBound {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfFaceBound;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfFaceBound;
		 StepShape_Array1OfFaceBound (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfFaceBound;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepShape_FaceBound &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfFaceBound;
		 StepShape_Array1OfFaceBound (const Handle_StepShape_FaceBound & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_FaceBound &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_FaceBound & V);
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
	:type Other: StepShape_Array1OfFaceBound &
	:rtype: StepShape_Array1OfFaceBound
") Assign;
		const StepShape_Array1OfFaceBound & Assign (const StepShape_Array1OfFaceBound & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfFaceBound &
	:rtype: StepShape_Array1OfFaceBound
") operator =;
		const StepShape_Array1OfFaceBound & operator = (const StepShape_Array1OfFaceBound & Other);
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
	:type Value: Handle_StepShape_FaceBound &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_FaceBound & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_FaceBound
") Value;
		Handle_StepShape_FaceBound Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_FaceBound
") ChangeValue;
		Handle_StepShape_FaceBound ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfFaceBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfGeometricSetSelect;
class StepShape_Array1OfGeometricSetSelect {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfGeometricSetSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfGeometricSetSelect;
		 StepShape_Array1OfGeometricSetSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfGeometricSetSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepShape_GeometricSetSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfGeometricSetSelect;
		 StepShape_Array1OfGeometricSetSelect (const StepShape_GeometricSetSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepShape_GeometricSetSelect &
	:rtype: None
") Init;
		void Init (const StepShape_GeometricSetSelect & V);
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
	:type Other: StepShape_Array1OfGeometricSetSelect &
	:rtype: StepShape_Array1OfGeometricSetSelect
") Assign;
		const StepShape_Array1OfGeometricSetSelect & Assign (const StepShape_Array1OfGeometricSetSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfGeometricSetSelect &
	:rtype: StepShape_Array1OfGeometricSetSelect
") operator =;
		const StepShape_Array1OfGeometricSetSelect & operator = (const StepShape_Array1OfGeometricSetSelect & Other);
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
	:type Value: StepShape_GeometricSetSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepShape_GeometricSetSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_GeometricSetSelect
") Value;
		const StepShape_GeometricSetSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_GeometricSetSelect
") ChangeValue;
		StepShape_GeometricSetSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfGeometricSetSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfOrientedClosedShell;
class StepShape_Array1OfOrientedClosedShell {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfOrientedClosedShell;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfOrientedClosedShell;
		 StepShape_Array1OfOrientedClosedShell (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfOrientedClosedShell;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepShape_OrientedClosedShell &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfOrientedClosedShell;
		 StepShape_Array1OfOrientedClosedShell (const Handle_StepShape_OrientedClosedShell & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_OrientedClosedShell &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_OrientedClosedShell & V);
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
	:type Other: StepShape_Array1OfOrientedClosedShell &
	:rtype: StepShape_Array1OfOrientedClosedShell
") Assign;
		const StepShape_Array1OfOrientedClosedShell & Assign (const StepShape_Array1OfOrientedClosedShell & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfOrientedClosedShell &
	:rtype: StepShape_Array1OfOrientedClosedShell
") operator =;
		const StepShape_Array1OfOrientedClosedShell & operator = (const StepShape_Array1OfOrientedClosedShell & Other);
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
	:type Value: Handle_StepShape_OrientedClosedShell &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_OrientedClosedShell & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_OrientedClosedShell
") Value;
		Handle_StepShape_OrientedClosedShell Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_OrientedClosedShell
") ChangeValue;
		Handle_StepShape_OrientedClosedShell ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfOrientedClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfOrientedEdge;
class StepShape_Array1OfOrientedEdge {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfOrientedEdge;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfOrientedEdge;
		 StepShape_Array1OfOrientedEdge (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfOrientedEdge;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepShape_OrientedEdge &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfOrientedEdge;
		 StepShape_Array1OfOrientedEdge (const Handle_StepShape_OrientedEdge & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_OrientedEdge &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_OrientedEdge & V);
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
	:type Other: StepShape_Array1OfOrientedEdge &
	:rtype: StepShape_Array1OfOrientedEdge
") Assign;
		const StepShape_Array1OfOrientedEdge & Assign (const StepShape_Array1OfOrientedEdge & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfOrientedEdge &
	:rtype: StepShape_Array1OfOrientedEdge
") operator =;
		const StepShape_Array1OfOrientedEdge & operator = (const StepShape_Array1OfOrientedEdge & Other);
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
	:type Value: Handle_StepShape_OrientedEdge &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_OrientedEdge & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_OrientedEdge
") Value;
		Handle_StepShape_OrientedEdge Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_OrientedEdge
") ChangeValue;
		Handle_StepShape_OrientedEdge ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfOrientedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfShell;
class StepShape_Array1OfShell {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfShell;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfShell;
		 StepShape_Array1OfShell (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfShell;
		%feature("autodoc", "	:param Item:
	:type Item: StepShape_Shell &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfShell;
		 StepShape_Array1OfShell (const StepShape_Shell & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepShape_Shell &
	:rtype: None
") Init;
		void Init (const StepShape_Shell & V);
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
	:type Other: StepShape_Array1OfShell &
	:rtype: StepShape_Array1OfShell
") Assign;
		const StepShape_Array1OfShell & Assign (const StepShape_Array1OfShell & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfShell &
	:rtype: StepShape_Array1OfShell
") operator =;
		const StepShape_Array1OfShell & operator = (const StepShape_Array1OfShell & Other);
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
	:type Value: StepShape_Shell &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepShape_Shell & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_Shell
") Value;
		const StepShape_Shell & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_Shell
") ChangeValue;
		StepShape_Shell & ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Array1OfValueQualifier;
class StepShape_Array1OfValueQualifier {
	public:
		%feature("compactdefaultargs") StepShape_Array1OfValueQualifier;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfValueQualifier;
		 StepShape_Array1OfValueQualifier (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_Array1OfValueQualifier;
		%feature("autodoc", "	:param Item:
	:type Item: StepShape_ValueQualifier &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_Array1OfValueQualifier;
		 StepShape_Array1OfValueQualifier (const StepShape_ValueQualifier & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepShape_ValueQualifier &
	:rtype: None
") Init;
		void Init (const StepShape_ValueQualifier & V);
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
	:type Other: StepShape_Array1OfValueQualifier &
	:rtype: StepShape_Array1OfValueQualifier
") Assign;
		const StepShape_Array1OfValueQualifier & Assign (const StepShape_Array1OfValueQualifier & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepShape_Array1OfValueQualifier &
	:rtype: StepShape_Array1OfValueQualifier
") operator =;
		const StepShape_Array1OfValueQualifier & operator = (const StepShape_Array1OfValueQualifier & Other);
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
	:type Value: StepShape_ValueQualifier &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepShape_ValueQualifier & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_ValueQualifier
") Value;
		const StepShape_ValueQualifier & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_ValueQualifier
") ChangeValue;
		StepShape_ValueQualifier & ChangeValue (const Standard_Integer Index);
};


%extend StepShape_Array1OfValueQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Block;
class StepShape_Block : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_Block;
		%feature("autodoc", "	* Returns a Block

	:rtype: None
") StepShape_Block;
		 StepShape_Block ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:param aX:
	:type aX: float
	:param aY:
	:type aY: float
	:param aZ:
	:type aZ: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition,const Standard_Real aX,const Standard_Real aY,const Standard_Real aZ);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:rtype: None
") SetPosition;
		void SetPosition (const Handle_StepGeom_Axis2Placement3d & aPosition);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis2Placement3d
") Position;
		Handle_StepGeom_Axis2Placement3d Position ();
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	:param aX:
	:type aX: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real aX);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	:param aY:
	:type aY: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real aY);
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "	:param aZ:
	:type aZ: float
	:rtype: None
") SetZ;
		void SetZ (const Standard_Real aZ);
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	:rtype: float
") Z;
		Standard_Real Z ();
};


%extend StepShape_Block {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Block(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Block::Handle_StepShape_Block %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Block;
class Handle_StepShape_Block : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_Block();
        Handle_StepShape_Block(const Handle_StepShape_Block &aHandle);
        Handle_StepShape_Block(const StepShape_Block *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Block DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Block {
    StepShape_Block* _get_reference() {
    return (StepShape_Block*)$self->Access();
    }
};

%extend Handle_StepShape_Block {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Block {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_BooleanOperand;
class StepShape_BooleanOperand {
	public:
		%feature("compactdefaultargs") StepShape_BooleanOperand;
		%feature("autodoc", "	* Returns a BooleanOperand SelectType

	:rtype: None
") StepShape_BooleanOperand;
		 StepShape_BooleanOperand ();
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "	:param aTypeOfContent:
	:type aTypeOfContent: int
	:rtype: None
") SetTypeOfContent;
		void SetTypeOfContent (const Standard_Integer aTypeOfContent);
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "	:rtype: int
") TypeOfContent;
		Standard_Integer TypeOfContent ();
		%feature("compactdefaultargs") SolidModel;
		%feature("autodoc", "	* returns Value as a SolidModel (Null if another type)

	:rtype: Handle_StepShape_SolidModel
") SolidModel;
		Handle_StepShape_SolidModel SolidModel ();
		%feature("compactdefaultargs") SetSolidModel;
		%feature("autodoc", "	:param aSolidModel:
	:type aSolidModel: Handle_StepShape_SolidModel &
	:rtype: None
") SetSolidModel;
		void SetSolidModel (const Handle_StepShape_SolidModel & aSolidModel);
		%feature("compactdefaultargs") HalfSpaceSolid;
		%feature("autodoc", "	* returns Value as a HalfSpaceSolid (Null if another type)

	:rtype: Handle_StepShape_HalfSpaceSolid
") HalfSpaceSolid;
		Handle_StepShape_HalfSpaceSolid HalfSpaceSolid ();
		%feature("compactdefaultargs") SetHalfSpaceSolid;
		%feature("autodoc", "	:param aHalfSpaceSolid:
	:type aHalfSpaceSolid: Handle_StepShape_HalfSpaceSolid &
	:rtype: None
") SetHalfSpaceSolid;
		void SetHalfSpaceSolid (const Handle_StepShape_HalfSpaceSolid & aHalfSpaceSolid);
		%feature("compactdefaultargs") CsgPrimitive;
		%feature("autodoc", "	* returns Value as a CsgPrimitive (Null if another type) CsgPrimitive is another Select Type

	:rtype: StepShape_CsgPrimitive
") CsgPrimitive;
		StepShape_CsgPrimitive CsgPrimitive ();
		%feature("compactdefaultargs") SetCsgPrimitive;
		%feature("autodoc", "	:param aCsgPrimitive:
	:type aCsgPrimitive: StepShape_CsgPrimitive &
	:rtype: None
") SetCsgPrimitive;
		void SetCsgPrimitive (const StepShape_CsgPrimitive & aCsgPrimitive);
		%feature("compactdefaultargs") BooleanResult;
		%feature("autodoc", "	* returns Value as a BooleanResult (Null if another type)

	:rtype: Handle_StepShape_BooleanResult
") BooleanResult;
		Handle_StepShape_BooleanResult BooleanResult ();
		%feature("compactdefaultargs") SetBooleanResult;
		%feature("autodoc", "	:param aBooleanResult:
	:type aBooleanResult: Handle_StepShape_BooleanResult &
	:rtype: None
") SetBooleanResult;
		void SetBooleanResult (const Handle_StepShape_BooleanResult & aBooleanResult);
};


%extend StepShape_BooleanOperand {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_BooleanResult;
class StepShape_BooleanResult : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_BooleanResult;
		%feature("autodoc", "	* Returns a BooleanResult

	:rtype: None
") StepShape_BooleanResult;
		 StepShape_BooleanResult ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOperator:
	:type aOperator: StepShape_BooleanOperator
	:param aFirstOperand:
	:type aFirstOperand: StepShape_BooleanOperand &
	:param aSecondOperand:
	:type aSecondOperand: StepShape_BooleanOperand &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepShape_BooleanOperator aOperator,const StepShape_BooleanOperand & aFirstOperand,const StepShape_BooleanOperand & aSecondOperand);
		%feature("compactdefaultargs") SetOperator;
		%feature("autodoc", "	:param aOperator:
	:type aOperator: StepShape_BooleanOperator
	:rtype: None
") SetOperator;
		void SetOperator (const StepShape_BooleanOperator aOperator);
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: StepShape_BooleanOperator
") Operator;
		StepShape_BooleanOperator Operator ();
		%feature("compactdefaultargs") SetFirstOperand;
		%feature("autodoc", "	:param aFirstOperand:
	:type aFirstOperand: StepShape_BooleanOperand &
	:rtype: None
") SetFirstOperand;
		void SetFirstOperand (const StepShape_BooleanOperand & aFirstOperand);
		%feature("compactdefaultargs") FirstOperand;
		%feature("autodoc", "	:rtype: StepShape_BooleanOperand
") FirstOperand;
		StepShape_BooleanOperand FirstOperand ();
		%feature("compactdefaultargs") SetSecondOperand;
		%feature("autodoc", "	:param aSecondOperand:
	:type aSecondOperand: StepShape_BooleanOperand &
	:rtype: None
") SetSecondOperand;
		void SetSecondOperand (const StepShape_BooleanOperand & aSecondOperand);
		%feature("compactdefaultargs") SecondOperand;
		%feature("autodoc", "	:rtype: StepShape_BooleanOperand
") SecondOperand;
		StepShape_BooleanOperand SecondOperand ();
};


%extend StepShape_BooleanResult {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_BooleanResult(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_BooleanResult::Handle_StepShape_BooleanResult %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_BooleanResult;
class Handle_StepShape_BooleanResult : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_BooleanResult();
        Handle_StepShape_BooleanResult(const Handle_StepShape_BooleanResult &aHandle);
        Handle_StepShape_BooleanResult(const StepShape_BooleanResult *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_BooleanResult DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_BooleanResult {
    StepShape_BooleanResult* _get_reference() {
    return (StepShape_BooleanResult*)$self->Access();
    }
};

%extend Handle_StepShape_BooleanResult {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_BooleanResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_BoxDomain;
class StepShape_BoxDomain : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_BoxDomain;
		%feature("autodoc", "	* Returns a BoxDomain

	:rtype: None
") StepShape_BoxDomain;
		 StepShape_BoxDomain ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aCorner:
	:type aCorner: Handle_StepGeom_CartesianPoint &
	:param aXlength:
	:type aXlength: float
	:param aYlength:
	:type aYlength: float
	:param aZlength:
	:type aZlength: float
	:rtype: void
") Init;
		virtual void Init (const Handle_StepGeom_CartesianPoint & aCorner,const Standard_Real aXlength,const Standard_Real aYlength,const Standard_Real aZlength);
		%feature("compactdefaultargs") SetCorner;
		%feature("autodoc", "	:param aCorner:
	:type aCorner: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetCorner;
		void SetCorner (const Handle_StepGeom_CartesianPoint & aCorner);
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianPoint
") Corner;
		Handle_StepGeom_CartesianPoint Corner ();
		%feature("compactdefaultargs") SetXlength;
		%feature("autodoc", "	:param aXlength:
	:type aXlength: float
	:rtype: None
") SetXlength;
		void SetXlength (const Standard_Real aXlength);
		%feature("compactdefaultargs") Xlength;
		%feature("autodoc", "	:rtype: float
") Xlength;
		Standard_Real Xlength ();
		%feature("compactdefaultargs") SetYlength;
		%feature("autodoc", "	:param aYlength:
	:type aYlength: float
	:rtype: None
") SetYlength;
		void SetYlength (const Standard_Real aYlength);
		%feature("compactdefaultargs") Ylength;
		%feature("autodoc", "	:rtype: float
") Ylength;
		Standard_Real Ylength ();
		%feature("compactdefaultargs") SetZlength;
		%feature("autodoc", "	:param aZlength:
	:type aZlength: float
	:rtype: None
") SetZlength;
		void SetZlength (const Standard_Real aZlength);
		%feature("compactdefaultargs") Zlength;
		%feature("autodoc", "	:rtype: float
") Zlength;
		Standard_Real Zlength ();
};


%extend StepShape_BoxDomain {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_BoxDomain(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_BoxDomain::Handle_StepShape_BoxDomain %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_BoxDomain;
class Handle_StepShape_BoxDomain : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_BoxDomain();
        Handle_StepShape_BoxDomain(const Handle_StepShape_BoxDomain &aHandle);
        Handle_StepShape_BoxDomain(const StepShape_BoxDomain *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_BoxDomain DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_BoxDomain {
    StepShape_BoxDomain* _get_reference() {
    return (StepShape_BoxDomain*)$self->Access();
    }
};

%extend Handle_StepShape_BoxDomain {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_BoxDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ConnectedFaceShapeRepresentation;
class StepShape_ConnectedFaceShapeRepresentation : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepShape_ConnectedFaceShapeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_ConnectedFaceShapeRepresentation;
		 StepShape_ConnectedFaceShapeRepresentation ();
};


%extend StepShape_ConnectedFaceShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ConnectedFaceShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ConnectedFaceShapeRepresentation::Handle_StepShape_ConnectedFaceShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ConnectedFaceShapeRepresentation;
class Handle_StepShape_ConnectedFaceShapeRepresentation : public Handle_StepRepr_Representation {

    public:
        // constructors
        Handle_StepShape_ConnectedFaceShapeRepresentation();
        Handle_StepShape_ConnectedFaceShapeRepresentation(const Handle_StepShape_ConnectedFaceShapeRepresentation &aHandle);
        Handle_StepShape_ConnectedFaceShapeRepresentation(const StepShape_ConnectedFaceShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ConnectedFaceShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ConnectedFaceShapeRepresentation {
    StepShape_ConnectedFaceShapeRepresentation* _get_reference() {
    return (StepShape_ConnectedFaceShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_ConnectedFaceShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ConnectedFaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ContextDependentShapeRepresentation;
class StepShape_ContextDependentShapeRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_ContextDependentShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") StepShape_ContextDependentShapeRepresentation;
		 StepShape_ContextDependentShapeRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aRepRel:
	:type aRepRel: Handle_StepRepr_ShapeRepresentationRelationship &
	:param aProRel:
	:type aProRel: Handle_StepRepr_ProductDefinitionShape &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_ShapeRepresentationRelationship & aRepRel,const Handle_StepRepr_ProductDefinitionShape & aProRel);
		%feature("compactdefaultargs") RepresentationRelation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ShapeRepresentationRelationship
") RepresentationRelation;
		Handle_StepRepr_ShapeRepresentationRelationship RepresentationRelation ();
		%feature("compactdefaultargs") SetRepresentationRelation;
		%feature("autodoc", "	:param aRepRel:
	:type aRepRel: Handle_StepRepr_ShapeRepresentationRelationship &
	:rtype: None
") SetRepresentationRelation;
		void SetRepresentationRelation (const Handle_StepRepr_ShapeRepresentationRelationship & aRepRel);
		%feature("compactdefaultargs") RepresentedProductRelation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ProductDefinitionShape
") RepresentedProductRelation;
		Handle_StepRepr_ProductDefinitionShape RepresentedProductRelation ();
		%feature("compactdefaultargs") SetRepresentedProductRelation;
		%feature("autodoc", "	:param aProRel:
	:type aProRel: Handle_StepRepr_ProductDefinitionShape &
	:rtype: None
") SetRepresentedProductRelation;
		void SetRepresentedProductRelation (const Handle_StepRepr_ProductDefinitionShape & aProRel);
};


%extend StepShape_ContextDependentShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ContextDependentShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ContextDependentShapeRepresentation::Handle_StepShape_ContextDependentShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ContextDependentShapeRepresentation;
class Handle_StepShape_ContextDependentShapeRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_ContextDependentShapeRepresentation();
        Handle_StepShape_ContextDependentShapeRepresentation(const Handle_StepShape_ContextDependentShapeRepresentation &aHandle);
        Handle_StepShape_ContextDependentShapeRepresentation(const StepShape_ContextDependentShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ContextDependentShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ContextDependentShapeRepresentation {
    StepShape_ContextDependentShapeRepresentation* _get_reference() {
    return (StepShape_ContextDependentShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_ContextDependentShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ContextDependentShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_CsgPrimitive;
class StepShape_CsgPrimitive : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepShape_CsgPrimitive;
		%feature("autodoc", "	* Returns a CsgPrimitive SelectType

	:rtype: None
") StepShape_CsgPrimitive;
		 StepShape_CsgPrimitive ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a CsgPrimitive Kind Entity that is : 1 -> Sphere 2 -> Block 3 -> RightAngularWedge 4 -> Torus 5 -> RightCircularCone 6 -> RightCircularCylinder 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "	* returns Value as a Sphere (Null if another type)

	:rtype: Handle_StepShape_Sphere
") Sphere;
		Handle_StepShape_Sphere Sphere ();
		%feature("compactdefaultargs") Block;
		%feature("autodoc", "	* returns Value as a Block (Null if another type)

	:rtype: Handle_StepShape_Block
") Block;
		Handle_StepShape_Block Block ();
		%feature("compactdefaultargs") RightAngularWedge;
		%feature("autodoc", "	* returns Value as a RightAngularWedge (Null if another type)

	:rtype: Handle_StepShape_RightAngularWedge
") RightAngularWedge;
		Handle_StepShape_RightAngularWedge RightAngularWedge ();
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "	* returns Value as a Torus (Null if another type)

	:rtype: Handle_StepShape_Torus
") Torus;
		Handle_StepShape_Torus Torus ();
		%feature("compactdefaultargs") RightCircularCone;
		%feature("autodoc", "	* returns Value as a RightCircularCone (Null if another type)

	:rtype: Handle_StepShape_RightCircularCone
") RightCircularCone;
		Handle_StepShape_RightCircularCone RightCircularCone ();
		%feature("compactdefaultargs") RightCircularCylinder;
		%feature("autodoc", "	* returns Value as a RightCircularCylinder (Null if another type)

	:rtype: Handle_StepShape_RightCircularCylinder
") RightCircularCylinder;
		Handle_StepShape_RightCircularCylinder RightCircularCylinder ();
};


%extend StepShape_CsgPrimitive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_CsgSelect;
class StepShape_CsgSelect {
	public:
		%feature("compactdefaultargs") StepShape_CsgSelect;
		%feature("autodoc", "	* Returns a CsgSelect SelectType

	:rtype: None
") StepShape_CsgSelect;
		 StepShape_CsgSelect ();
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "	:param aTypeOfContent:
	:type aTypeOfContent: int
	:rtype: None
") SetTypeOfContent;
		void SetTypeOfContent (const Standard_Integer aTypeOfContent);
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "	:rtype: int
") TypeOfContent;
		Standard_Integer TypeOfContent ();
		%feature("compactdefaultargs") BooleanResult;
		%feature("autodoc", "	* returns Value as a BooleanResult (Null if another type)

	:rtype: Handle_StepShape_BooleanResult
") BooleanResult;
		Handle_StepShape_BooleanResult BooleanResult ();
		%feature("compactdefaultargs") SetBooleanResult;
		%feature("autodoc", "	:param aBooleanResult:
	:type aBooleanResult: Handle_StepShape_BooleanResult &
	:rtype: None
") SetBooleanResult;
		void SetBooleanResult (const Handle_StepShape_BooleanResult & aBooleanResult);
		%feature("compactdefaultargs") CsgPrimitive;
		%feature("autodoc", "	* returns Value as a CsgPrimitive (Null if another type)

	:rtype: StepShape_CsgPrimitive
") CsgPrimitive;
		StepShape_CsgPrimitive CsgPrimitive ();
		%feature("compactdefaultargs") SetCsgPrimitive;
		%feature("autodoc", "	:param aCsgPrimitive:
	:type aCsgPrimitive: StepShape_CsgPrimitive &
	:rtype: None
") SetCsgPrimitive;
		void SetCsgPrimitive (const StepShape_CsgPrimitive & aCsgPrimitive);
};


%extend StepShape_CsgSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_DefinitionalRepresentationAndShapeRepresentation;
class StepShape_DefinitionalRepresentationAndShapeRepresentation : public StepRepr_DefinitionalRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_DefinitionalRepresentationAndShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") StepShape_DefinitionalRepresentationAndShapeRepresentation;
		 StepShape_DefinitionalRepresentationAndShapeRepresentation ();
};


%extend StepShape_DefinitionalRepresentationAndShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation::Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation;
class Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation : public Handle_StepRepr_DefinitionalRepresentation {

    public:
        // constructors
        Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation();
        Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation(const Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation &aHandle);
        Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation(const StepShape_DefinitionalRepresentationAndShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation {
    StepShape_DefinitionalRepresentationAndShapeRepresentation* _get_reference() {
    return (StepShape_DefinitionalRepresentationAndShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_DefinitionalRepresentationAndShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_DimensionalCharacteristic;
class StepShape_DimensionalCharacteristic : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepShape_DimensionalCharacteristic;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_DimensionalCharacteristic;
		 StepShape_DimensionalCharacteristic ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of DimensionalCharacteristic select type 1 -> DimensionalLocation from StepShape 2 -> DimensionalSize from StepShape 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "	* Returns Value as DimensionalLocation (or Null if another type)

	:rtype: Handle_StepShape_DimensionalLocation
") DimensionalLocation;
		Handle_StepShape_DimensionalLocation DimensionalLocation ();
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "	* Returns Value as DimensionalSize (or Null if another type)

	:rtype: Handle_StepShape_DimensionalSize
") DimensionalSize;
		Handle_StepShape_DimensionalSize DimensionalSize ();
};


%extend StepShape_DimensionalCharacteristic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_DimensionalCharacteristicRepresentation;
class StepShape_DimensionalCharacteristicRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_DimensionalCharacteristicRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_DimensionalCharacteristicRepresentation;
		 StepShape_DimensionalCharacteristicRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDimension:
	:type aDimension: StepShape_DimensionalCharacteristic &
	:param aRepresentation:
	:type aRepresentation: Handle_StepShape_ShapeDimensionRepresentation &
	:rtype: None
") Init;
		void Init (const StepShape_DimensionalCharacteristic & aDimension,const Handle_StepShape_ShapeDimensionRepresentation & aRepresentation);
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "	* Returns field Dimension

	:rtype: StepShape_DimensionalCharacteristic
") Dimension;
		StepShape_DimensionalCharacteristic Dimension ();
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "	* Set field Dimension

	:param Dimension:
	:type Dimension: StepShape_DimensionalCharacteristic &
	:rtype: None
") SetDimension;
		void SetDimension (const StepShape_DimensionalCharacteristic & Dimension);
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	* Returns field Representation

	:rtype: Handle_StepShape_ShapeDimensionRepresentation
") Representation;
		Handle_StepShape_ShapeDimensionRepresentation Representation ();
		%feature("compactdefaultargs") SetRepresentation;
		%feature("autodoc", "	* Set field Representation

	:param Representation:
	:type Representation: Handle_StepShape_ShapeDimensionRepresentation &
	:rtype: None
") SetRepresentation;
		void SetRepresentation (const Handle_StepShape_ShapeDimensionRepresentation & Representation);
};


%extend StepShape_DimensionalCharacteristicRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_DimensionalCharacteristicRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_DimensionalCharacteristicRepresentation::Handle_StepShape_DimensionalCharacteristicRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_DimensionalCharacteristicRepresentation;
class Handle_StepShape_DimensionalCharacteristicRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_DimensionalCharacteristicRepresentation();
        Handle_StepShape_DimensionalCharacteristicRepresentation(const Handle_StepShape_DimensionalCharacteristicRepresentation &aHandle);
        Handle_StepShape_DimensionalCharacteristicRepresentation(const StepShape_DimensionalCharacteristicRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_DimensionalCharacteristicRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_DimensionalCharacteristicRepresentation {
    StepShape_DimensionalCharacteristicRepresentation* _get_reference() {
    return (StepShape_DimensionalCharacteristicRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_DimensionalCharacteristicRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_DimensionalCharacteristicRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_DimensionalLocation;
class StepShape_DimensionalLocation : public StepRepr_ShapeAspectRelationship {
	public:
		%feature("compactdefaultargs") StepShape_DimensionalLocation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_DimensionalLocation;
		 StepShape_DimensionalLocation ();
};


%extend StepShape_DimensionalLocation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_DimensionalLocation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_DimensionalLocation::Handle_StepShape_DimensionalLocation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_DimensionalLocation;
class Handle_StepShape_DimensionalLocation : public Handle_StepRepr_ShapeAspectRelationship {

    public:
        // constructors
        Handle_StepShape_DimensionalLocation();
        Handle_StepShape_DimensionalLocation(const Handle_StepShape_DimensionalLocation &aHandle);
        Handle_StepShape_DimensionalLocation(const StepShape_DimensionalLocation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_DimensionalLocation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_DimensionalLocation {
    StepShape_DimensionalLocation* _get_reference() {
    return (StepShape_DimensionalLocation*)$self->Access();
    }
};

%extend Handle_StepShape_DimensionalLocation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_DimensionalLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_DimensionalSize;
class StepShape_DimensionalSize : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_DimensionalSize;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_DimensionalSize;
		 StepShape_DimensionalSize ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAppliesTo:
	:type aAppliesTo: Handle_StepRepr_ShapeAspect &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_ShapeAspect & aAppliesTo,const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") AppliesTo;
		%feature("autodoc", "	* Returns field AppliesTo

	:rtype: Handle_StepRepr_ShapeAspect
") AppliesTo;
		Handle_StepRepr_ShapeAspect AppliesTo ();
		%feature("compactdefaultargs") SetAppliesTo;
		%feature("autodoc", "	* Set field AppliesTo

	:param AppliesTo:
	:type AppliesTo: Handle_StepRepr_ShapeAspect &
	:rtype: None
") SetAppliesTo;
		void SetAppliesTo (const Handle_StepRepr_ShapeAspect & AppliesTo);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
};


%extend StepShape_DimensionalSize {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_DimensionalSize(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_DimensionalSize::Handle_StepShape_DimensionalSize %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_DimensionalSize;
class Handle_StepShape_DimensionalSize : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_DimensionalSize();
        Handle_StepShape_DimensionalSize(const Handle_StepShape_DimensionalSize &aHandle);
        Handle_StepShape_DimensionalSize(const StepShape_DimensionalSize *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_DimensionalSize DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_DimensionalSize {
    StepShape_DimensionalSize* _get_reference() {
    return (StepShape_DimensionalSize*)$self->Access();
    }
};

%extend Handle_StepShape_DimensionalSize {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_DimensionalSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_EdgeBasedWireframeModel;
class StepShape_EdgeBasedWireframeModel : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_EdgeBasedWireframeModel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_EdgeBasedWireframeModel;
		 StepShape_EdgeBasedWireframeModel ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aEbwmBoundary:
	:type aEbwmBoundary: Handle_StepShape_HArray1OfConnectedEdgeSet &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepShape_HArray1OfConnectedEdgeSet & aEbwmBoundary);
		%feature("compactdefaultargs") EbwmBoundary;
		%feature("autodoc", "	* Returns field EbwmBoundary

	:rtype: Handle_StepShape_HArray1OfConnectedEdgeSet
") EbwmBoundary;
		Handle_StepShape_HArray1OfConnectedEdgeSet EbwmBoundary ();
		%feature("compactdefaultargs") SetEbwmBoundary;
		%feature("autodoc", "	* Set field EbwmBoundary

	:param EbwmBoundary:
	:type EbwmBoundary: Handle_StepShape_HArray1OfConnectedEdgeSet &
	:rtype: None
") SetEbwmBoundary;
		void SetEbwmBoundary (const Handle_StepShape_HArray1OfConnectedEdgeSet & EbwmBoundary);
};


%extend StepShape_EdgeBasedWireframeModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_EdgeBasedWireframeModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_EdgeBasedWireframeModel::Handle_StepShape_EdgeBasedWireframeModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_EdgeBasedWireframeModel;
class Handle_StepShape_EdgeBasedWireframeModel : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_EdgeBasedWireframeModel();
        Handle_StepShape_EdgeBasedWireframeModel(const Handle_StepShape_EdgeBasedWireframeModel &aHandle);
        Handle_StepShape_EdgeBasedWireframeModel(const StepShape_EdgeBasedWireframeModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_EdgeBasedWireframeModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_EdgeBasedWireframeModel {
    StepShape_EdgeBasedWireframeModel* _get_reference() {
    return (StepShape_EdgeBasedWireframeModel*)$self->Access();
    }
};

%extend Handle_StepShape_EdgeBasedWireframeModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_EdgeBasedWireframeModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_FaceBasedSurfaceModel;
class StepShape_FaceBasedSurfaceModel : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_FaceBasedSurfaceModel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_FaceBasedSurfaceModel;
		 StepShape_FaceBasedSurfaceModel ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFbsmFaces:
	:type aFbsmFaces: Handle_StepShape_HArray1OfConnectedFaceSet &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepShape_HArray1OfConnectedFaceSet & aFbsmFaces);
		%feature("compactdefaultargs") FbsmFaces;
		%feature("autodoc", "	* Returns field FbsmFaces

	:rtype: Handle_StepShape_HArray1OfConnectedFaceSet
") FbsmFaces;
		Handle_StepShape_HArray1OfConnectedFaceSet FbsmFaces ();
		%feature("compactdefaultargs") SetFbsmFaces;
		%feature("autodoc", "	* Set field FbsmFaces

	:param FbsmFaces:
	:type FbsmFaces: Handle_StepShape_HArray1OfConnectedFaceSet &
	:rtype: None
") SetFbsmFaces;
		void SetFbsmFaces (const Handle_StepShape_HArray1OfConnectedFaceSet & FbsmFaces);
};


%extend StepShape_FaceBasedSurfaceModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_FaceBasedSurfaceModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_FaceBasedSurfaceModel::Handle_StepShape_FaceBasedSurfaceModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_FaceBasedSurfaceModel;
class Handle_StepShape_FaceBasedSurfaceModel : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_FaceBasedSurfaceModel();
        Handle_StepShape_FaceBasedSurfaceModel(const Handle_StepShape_FaceBasedSurfaceModel &aHandle);
        Handle_StepShape_FaceBasedSurfaceModel(const StepShape_FaceBasedSurfaceModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_FaceBasedSurfaceModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_FaceBasedSurfaceModel {
    StepShape_FaceBasedSurfaceModel* _get_reference() {
    return (StepShape_FaceBasedSurfaceModel*)$self->Access();
    }
};

%extend Handle_StepShape_FaceBasedSurfaceModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_FaceBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_GeometricSet;
class StepShape_GeometricSet : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_GeometricSet;
		%feature("autodoc", "	* Returns a GeometricSet

	:rtype: None
") StepShape_GeometricSet;
		 StepShape_GeometricSet ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aElements:
	:type aElements: Handle_StepShape_HArray1OfGeometricSetSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfGeometricSetSelect & aElements);
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "	:param aElements:
	:type aElements: Handle_StepShape_HArray1OfGeometricSetSelect &
	:rtype: None
") SetElements;
		void SetElements (const Handle_StepShape_HArray1OfGeometricSetSelect & aElements);
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfGeometricSetSelect
") Elements;
		Handle_StepShape_HArray1OfGeometricSetSelect Elements ();
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepShape_GeometricSetSelect
") ElementsValue;
		StepShape_GeometricSetSelect ElementsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	:rtype: int
") NbElements;
		Standard_Integer NbElements ();
};


%extend StepShape_GeometricSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_GeometricSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_GeometricSet::Handle_StepShape_GeometricSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_GeometricSet;
class Handle_StepShape_GeometricSet : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_GeometricSet();
        Handle_StepShape_GeometricSet(const Handle_StepShape_GeometricSet &aHandle);
        Handle_StepShape_GeometricSet(const StepShape_GeometricSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_GeometricSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_GeometricSet {
    StepShape_GeometricSet* _get_reference() {
    return (StepShape_GeometricSet*)$self->Access();
    }
};

%extend Handle_StepShape_GeometricSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_GeometricSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_GeometricSetSelect;
class StepShape_GeometricSetSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepShape_GeometricSetSelect;
		%feature("autodoc", "	* Returns a GeometricSetSelect SelectType

	:rtype: None
") StepShape_GeometricSetSelect;
		 StepShape_GeometricSetSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a GeometricSetSelect Kind Entity that is : 1 -> Point 2 -> Curve 3 -> Surface 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* returns Value as a Point (Null if another type)

	:rtype: Handle_StepGeom_Point
") Point;
		Handle_StepGeom_Point Point ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* returns Value as a Curve (Null if another type)

	:rtype: Handle_StepGeom_Curve
") Curve;
		Handle_StepGeom_Curve Curve ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* returns Value as a Surface (Null if another type)

	:rtype: Handle_StepGeom_Surface
") Surface;
		Handle_StepGeom_Surface Surface ();
};


%extend StepShape_GeometricSetSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfConnectedEdgeSet;
class StepShape_HArray1OfConnectedEdgeSet : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfConnectedEdgeSet;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfConnectedEdgeSet;
		 StepShape_HArray1OfConnectedEdgeSet (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfConnectedEdgeSet;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepShape_ConnectedEdgeSet &
	:rtype: None
") StepShape_HArray1OfConnectedEdgeSet;
		 StepShape_HArray1OfConnectedEdgeSet (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepShape_ConnectedEdgeSet & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_ConnectedEdgeSet &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_ConnectedEdgeSet & V);
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
	:type Value: Handle_StepShape_ConnectedEdgeSet &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_ConnectedEdgeSet & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_ConnectedEdgeSet
") Value;
		Handle_StepShape_ConnectedEdgeSet Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_ConnectedEdgeSet
") ChangeValue;
		Handle_StepShape_ConnectedEdgeSet ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfConnectedEdgeSet
") Array1;
		const StepShape_Array1OfConnectedEdgeSet & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfConnectedEdgeSet
") ChangeArray1;
		StepShape_Array1OfConnectedEdgeSet & ChangeArray1 ();
};


%extend StepShape_HArray1OfConnectedEdgeSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfConnectedEdgeSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfConnectedEdgeSet::Handle_StepShape_HArray1OfConnectedEdgeSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfConnectedEdgeSet;
class Handle_StepShape_HArray1OfConnectedEdgeSet : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfConnectedEdgeSet();
        Handle_StepShape_HArray1OfConnectedEdgeSet(const Handle_StepShape_HArray1OfConnectedEdgeSet &aHandle);
        Handle_StepShape_HArray1OfConnectedEdgeSet(const StepShape_HArray1OfConnectedEdgeSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfConnectedEdgeSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfConnectedEdgeSet {
    StepShape_HArray1OfConnectedEdgeSet* _get_reference() {
    return (StepShape_HArray1OfConnectedEdgeSet*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfConnectedEdgeSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfConnectedEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfConnectedFaceSet;
class StepShape_HArray1OfConnectedFaceSet : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfConnectedFaceSet;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfConnectedFaceSet;
		 StepShape_HArray1OfConnectedFaceSet (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfConnectedFaceSet;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") StepShape_HArray1OfConnectedFaceSet;
		 StepShape_HArray1OfConnectedFaceSet (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepShape_ConnectedFaceSet & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_ConnectedFaceSet & V);
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
	:type Value: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_ConnectedFaceSet & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_ConnectedFaceSet
") Value;
		Handle_StepShape_ConnectedFaceSet Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_ConnectedFaceSet
") ChangeValue;
		Handle_StepShape_ConnectedFaceSet ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfConnectedFaceSet
") Array1;
		const StepShape_Array1OfConnectedFaceSet & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfConnectedFaceSet
") ChangeArray1;
		StepShape_Array1OfConnectedFaceSet & ChangeArray1 ();
};


%extend StepShape_HArray1OfConnectedFaceSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfConnectedFaceSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfConnectedFaceSet::Handle_StepShape_HArray1OfConnectedFaceSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfConnectedFaceSet;
class Handle_StepShape_HArray1OfConnectedFaceSet : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfConnectedFaceSet();
        Handle_StepShape_HArray1OfConnectedFaceSet(const Handle_StepShape_HArray1OfConnectedFaceSet &aHandle);
        Handle_StepShape_HArray1OfConnectedFaceSet(const StepShape_HArray1OfConnectedFaceSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfConnectedFaceSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfConnectedFaceSet {
    StepShape_HArray1OfConnectedFaceSet* _get_reference() {
    return (StepShape_HArray1OfConnectedFaceSet*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfConnectedFaceSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfConnectedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfEdge;
class StepShape_HArray1OfEdge : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfEdge;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfEdge;
		 StepShape_HArray1OfEdge (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfEdge;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepShape_Edge &
	:rtype: None
") StepShape_HArray1OfEdge;
		 StepShape_HArray1OfEdge (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepShape_Edge & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_Edge &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_Edge & V);
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
	:type Value: Handle_StepShape_Edge &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_Edge & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_Edge
") Value;
		Handle_StepShape_Edge Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_Edge
") ChangeValue;
		Handle_StepShape_Edge ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfEdge
") Array1;
		const StepShape_Array1OfEdge & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfEdge
") ChangeArray1;
		StepShape_Array1OfEdge & ChangeArray1 ();
};


%extend StepShape_HArray1OfEdge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfEdge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfEdge::Handle_StepShape_HArray1OfEdge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfEdge;
class Handle_StepShape_HArray1OfEdge : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfEdge();
        Handle_StepShape_HArray1OfEdge(const Handle_StepShape_HArray1OfEdge &aHandle);
        Handle_StepShape_HArray1OfEdge(const StepShape_HArray1OfEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfEdge {
    StepShape_HArray1OfEdge* _get_reference() {
    return (StepShape_HArray1OfEdge*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfEdge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfFace;
class StepShape_HArray1OfFace : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfFace;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfFace;
		 StepShape_HArray1OfFace (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfFace;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepShape_Face &
	:rtype: None
") StepShape_HArray1OfFace;
		 StepShape_HArray1OfFace (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepShape_Face & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_Face &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_Face & V);
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
	:type Value: Handle_StepShape_Face &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_Face & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_Face
") Value;
		Handle_StepShape_Face Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_Face
") ChangeValue;
		Handle_StepShape_Face ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfFace
") Array1;
		const StepShape_Array1OfFace & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfFace
") ChangeArray1;
		StepShape_Array1OfFace & ChangeArray1 ();
};


%extend StepShape_HArray1OfFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfFace::Handle_StepShape_HArray1OfFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfFace;
class Handle_StepShape_HArray1OfFace : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfFace();
        Handle_StepShape_HArray1OfFace(const Handle_StepShape_HArray1OfFace &aHandle);
        Handle_StepShape_HArray1OfFace(const StepShape_HArray1OfFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfFace {
    StepShape_HArray1OfFace* _get_reference() {
    return (StepShape_HArray1OfFace*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfFace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfFaceBound;
class StepShape_HArray1OfFaceBound : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfFaceBound;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfFaceBound;
		 StepShape_HArray1OfFaceBound (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfFaceBound;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepShape_FaceBound &
	:rtype: None
") StepShape_HArray1OfFaceBound;
		 StepShape_HArray1OfFaceBound (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepShape_FaceBound & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_FaceBound &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_FaceBound & V);
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
	:type Value: Handle_StepShape_FaceBound &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_FaceBound & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_FaceBound
") Value;
		Handle_StepShape_FaceBound Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_FaceBound
") ChangeValue;
		Handle_StepShape_FaceBound ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfFaceBound
") Array1;
		const StepShape_Array1OfFaceBound & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfFaceBound
") ChangeArray1;
		StepShape_Array1OfFaceBound & ChangeArray1 ();
};


%extend StepShape_HArray1OfFaceBound {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfFaceBound(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfFaceBound::Handle_StepShape_HArray1OfFaceBound %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfFaceBound;
class Handle_StepShape_HArray1OfFaceBound : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfFaceBound();
        Handle_StepShape_HArray1OfFaceBound(const Handle_StepShape_HArray1OfFaceBound &aHandle);
        Handle_StepShape_HArray1OfFaceBound(const StepShape_HArray1OfFaceBound *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfFaceBound DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfFaceBound {
    StepShape_HArray1OfFaceBound* _get_reference() {
    return (StepShape_HArray1OfFaceBound*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfFaceBound {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfFaceBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfGeometricSetSelect;
class StepShape_HArray1OfGeometricSetSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfGeometricSetSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfGeometricSetSelect;
		 StepShape_HArray1OfGeometricSetSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfGeometricSetSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepShape_GeometricSetSelect &
	:rtype: None
") StepShape_HArray1OfGeometricSetSelect;
		 StepShape_HArray1OfGeometricSetSelect (const Standard_Integer Low,const Standard_Integer Up,const StepShape_GeometricSetSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepShape_GeometricSetSelect &
	:rtype: None
") Init;
		void Init (const StepShape_GeometricSetSelect & V);
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
	:type Value: StepShape_GeometricSetSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepShape_GeometricSetSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_GeometricSetSelect
") Value;
		const StepShape_GeometricSetSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_GeometricSetSelect
") ChangeValue;
		StepShape_GeometricSetSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfGeometricSetSelect
") Array1;
		const StepShape_Array1OfGeometricSetSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfGeometricSetSelect
") ChangeArray1;
		StepShape_Array1OfGeometricSetSelect & ChangeArray1 ();
};


%extend StepShape_HArray1OfGeometricSetSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfGeometricSetSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfGeometricSetSelect::Handle_StepShape_HArray1OfGeometricSetSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfGeometricSetSelect;
class Handle_StepShape_HArray1OfGeometricSetSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfGeometricSetSelect();
        Handle_StepShape_HArray1OfGeometricSetSelect(const Handle_StepShape_HArray1OfGeometricSetSelect &aHandle);
        Handle_StepShape_HArray1OfGeometricSetSelect(const StepShape_HArray1OfGeometricSetSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfGeometricSetSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfGeometricSetSelect {
    StepShape_HArray1OfGeometricSetSelect* _get_reference() {
    return (StepShape_HArray1OfGeometricSetSelect*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfGeometricSetSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfGeometricSetSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfOrientedClosedShell;
class StepShape_HArray1OfOrientedClosedShell : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfOrientedClosedShell;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfOrientedClosedShell;
		 StepShape_HArray1OfOrientedClosedShell (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfOrientedClosedShell;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepShape_OrientedClosedShell &
	:rtype: None
") StepShape_HArray1OfOrientedClosedShell;
		 StepShape_HArray1OfOrientedClosedShell (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepShape_OrientedClosedShell & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_OrientedClosedShell &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_OrientedClosedShell & V);
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
	:type Value: Handle_StepShape_OrientedClosedShell &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_OrientedClosedShell & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_OrientedClosedShell
") Value;
		Handle_StepShape_OrientedClosedShell Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_OrientedClosedShell
") ChangeValue;
		Handle_StepShape_OrientedClosedShell ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfOrientedClosedShell
") Array1;
		const StepShape_Array1OfOrientedClosedShell & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfOrientedClosedShell
") ChangeArray1;
		StepShape_Array1OfOrientedClosedShell & ChangeArray1 ();
};


%extend StepShape_HArray1OfOrientedClosedShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfOrientedClosedShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfOrientedClosedShell::Handle_StepShape_HArray1OfOrientedClosedShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfOrientedClosedShell;
class Handle_StepShape_HArray1OfOrientedClosedShell : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfOrientedClosedShell();
        Handle_StepShape_HArray1OfOrientedClosedShell(const Handle_StepShape_HArray1OfOrientedClosedShell &aHandle);
        Handle_StepShape_HArray1OfOrientedClosedShell(const StepShape_HArray1OfOrientedClosedShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfOrientedClosedShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfOrientedClosedShell {
    StepShape_HArray1OfOrientedClosedShell* _get_reference() {
    return (StepShape_HArray1OfOrientedClosedShell*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfOrientedClosedShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfOrientedClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfOrientedEdge;
class StepShape_HArray1OfOrientedEdge : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfOrientedEdge;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfOrientedEdge;
		 StepShape_HArray1OfOrientedEdge (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfOrientedEdge;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepShape_OrientedEdge &
	:rtype: None
") StepShape_HArray1OfOrientedEdge;
		 StepShape_HArray1OfOrientedEdge (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepShape_OrientedEdge & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_OrientedEdge &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_OrientedEdge & V);
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
	:type Value: Handle_StepShape_OrientedEdge &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepShape_OrientedEdge & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_OrientedEdge
") Value;
		Handle_StepShape_OrientedEdge Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepShape_OrientedEdge
") ChangeValue;
		Handle_StepShape_OrientedEdge ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfOrientedEdge
") Array1;
		const StepShape_Array1OfOrientedEdge & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfOrientedEdge
") ChangeArray1;
		StepShape_Array1OfOrientedEdge & ChangeArray1 ();
};


%extend StepShape_HArray1OfOrientedEdge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfOrientedEdge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfOrientedEdge::Handle_StepShape_HArray1OfOrientedEdge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfOrientedEdge;
class Handle_StepShape_HArray1OfOrientedEdge : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfOrientedEdge();
        Handle_StepShape_HArray1OfOrientedEdge(const Handle_StepShape_HArray1OfOrientedEdge &aHandle);
        Handle_StepShape_HArray1OfOrientedEdge(const StepShape_HArray1OfOrientedEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfOrientedEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfOrientedEdge {
    StepShape_HArray1OfOrientedEdge* _get_reference() {
    return (StepShape_HArray1OfOrientedEdge*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfOrientedEdge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfOrientedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfShell;
class StepShape_HArray1OfShell : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfShell;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfShell;
		 StepShape_HArray1OfShell (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfShell;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepShape_Shell &
	:rtype: None
") StepShape_HArray1OfShell;
		 StepShape_HArray1OfShell (const Standard_Integer Low,const Standard_Integer Up,const StepShape_Shell & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepShape_Shell &
	:rtype: None
") Init;
		void Init (const StepShape_Shell & V);
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
	:type Value: StepShape_Shell &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepShape_Shell & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_Shell
") Value;
		const StepShape_Shell & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_Shell
") ChangeValue;
		StepShape_Shell & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfShell
") Array1;
		const StepShape_Array1OfShell & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfShell
") ChangeArray1;
		StepShape_Array1OfShell & ChangeArray1 ();
};


%extend StepShape_HArray1OfShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfShell::Handle_StepShape_HArray1OfShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfShell;
class Handle_StepShape_HArray1OfShell : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfShell();
        Handle_StepShape_HArray1OfShell(const Handle_StepShape_HArray1OfShell &aHandle);
        Handle_StepShape_HArray1OfShell(const StepShape_HArray1OfShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfShell {
    StepShape_HArray1OfShell* _get_reference() {
    return (StepShape_HArray1OfShell*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HArray1OfValueQualifier;
class StepShape_HArray1OfValueQualifier : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_HArray1OfValueQualifier;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepShape_HArray1OfValueQualifier;
		 StepShape_HArray1OfValueQualifier (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepShape_HArray1OfValueQualifier;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepShape_ValueQualifier &
	:rtype: None
") StepShape_HArray1OfValueQualifier;
		 StepShape_HArray1OfValueQualifier (const Standard_Integer Low,const Standard_Integer Up,const StepShape_ValueQualifier & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepShape_ValueQualifier &
	:rtype: None
") Init;
		void Init (const StepShape_ValueQualifier & V);
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
	:type Value: StepShape_ValueQualifier &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepShape_ValueQualifier & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_ValueQualifier
") Value;
		const StepShape_ValueQualifier & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepShape_ValueQualifier
") ChangeValue;
		StepShape_ValueQualifier & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfValueQualifier
") Array1;
		const StepShape_Array1OfValueQualifier & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepShape_Array1OfValueQualifier
") ChangeArray1;
		StepShape_Array1OfValueQualifier & ChangeArray1 ();
};


%extend StepShape_HArray1OfValueQualifier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HArray1OfValueQualifier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HArray1OfValueQualifier::Handle_StepShape_HArray1OfValueQualifier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HArray1OfValueQualifier;
class Handle_StepShape_HArray1OfValueQualifier : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_HArray1OfValueQualifier();
        Handle_StepShape_HArray1OfValueQualifier(const Handle_StepShape_HArray1OfValueQualifier &aHandle);
        Handle_StepShape_HArray1OfValueQualifier(const StepShape_HArray1OfValueQualifier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HArray1OfValueQualifier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HArray1OfValueQualifier {
    StepShape_HArray1OfValueQualifier* _get_reference() {
    return (StepShape_HArray1OfValueQualifier*)$self->Access();
    }
};

%extend Handle_StepShape_HArray1OfValueQualifier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HArray1OfValueQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_HalfSpaceSolid;
class StepShape_HalfSpaceSolid : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_HalfSpaceSolid;
		%feature("autodoc", "	* Returns a HalfSpaceSolid

	:rtype: None
") StepShape_HalfSpaceSolid;
		 StepShape_HalfSpaceSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBaseSurface:
	:type aBaseSurface: Handle_StepGeom_Surface &
	:param aAgreementFlag:
	:type aAgreementFlag: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBaseSurface,const Standard_Boolean aAgreementFlag);
		%feature("compactdefaultargs") SetBaseSurface;
		%feature("autodoc", "	:param aBaseSurface:
	:type aBaseSurface: Handle_StepGeom_Surface &
	:rtype: None
") SetBaseSurface;
		void SetBaseSurface (const Handle_StepGeom_Surface & aBaseSurface);
		%feature("compactdefaultargs") BaseSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") BaseSurface;
		Handle_StepGeom_Surface BaseSurface ();
		%feature("compactdefaultargs") SetAgreementFlag;
		%feature("autodoc", "	:param aAgreementFlag:
	:type aAgreementFlag: bool
	:rtype: None
") SetAgreementFlag;
		void SetAgreementFlag (const Standard_Boolean aAgreementFlag);
		%feature("compactdefaultargs") AgreementFlag;
		%feature("autodoc", "	:rtype: bool
") AgreementFlag;
		Standard_Boolean AgreementFlag ();
};


%extend StepShape_HalfSpaceSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_HalfSpaceSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_HalfSpaceSolid::Handle_StepShape_HalfSpaceSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_HalfSpaceSolid;
class Handle_StepShape_HalfSpaceSolid : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_HalfSpaceSolid();
        Handle_StepShape_HalfSpaceSolid(const Handle_StepShape_HalfSpaceSolid &aHandle);
        Handle_StepShape_HalfSpaceSolid(const StepShape_HalfSpaceSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_HalfSpaceSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_HalfSpaceSolid {
    StepShape_HalfSpaceSolid* _get_reference() {
    return (StepShape_HalfSpaceSolid*)$self->Access();
    }
};

%extend Handle_StepShape_HalfSpaceSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_HalfSpaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_LimitsAndFits;
class StepShape_LimitsAndFits : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_LimitsAndFits;
		%feature("autodoc", "	:rtype: None
") StepShape_LimitsAndFits;
		 StepShape_LimitsAndFits ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param form_variance:
	:type form_variance: Handle_TCollection_HAsciiString &
	:param zone_variance:
	:type zone_variance: Handle_TCollection_HAsciiString &
	:param grade:
	:type grade: Handle_TCollection_HAsciiString &
	:param source:
	:type source: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & form_variance,const Handle_TCollection_HAsciiString & zone_variance,const Handle_TCollection_HAsciiString & grade,const Handle_TCollection_HAsciiString & source);
		%feature("compactdefaultargs") FormVariance;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") FormVariance;
		Handle_TCollection_HAsciiString FormVariance ();
		%feature("compactdefaultargs") SetFormVariance;
		%feature("autodoc", "	:param form_variance:
	:type form_variance: Handle_TCollection_HAsciiString &
	:rtype: None
") SetFormVariance;
		void SetFormVariance (const Handle_TCollection_HAsciiString & form_variance);
		%feature("compactdefaultargs") ZoneVariance;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ZoneVariance;
		Handle_TCollection_HAsciiString ZoneVariance ();
		%feature("compactdefaultargs") SetZoneVariance;
		%feature("autodoc", "	:param zone_variance:
	:type zone_variance: Handle_TCollection_HAsciiString &
	:rtype: None
") SetZoneVariance;
		void SetZoneVariance (const Handle_TCollection_HAsciiString & zone_variance);
		%feature("compactdefaultargs") Grade;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Grade;
		Handle_TCollection_HAsciiString Grade ();
		%feature("compactdefaultargs") SetGrade;
		%feature("autodoc", "	:param grade:
	:type grade: Handle_TCollection_HAsciiString &
	:rtype: None
") SetGrade;
		void SetGrade (const Handle_TCollection_HAsciiString & grade);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Source;
		Handle_TCollection_HAsciiString Source ();
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	:param source:
	:type source: Handle_TCollection_HAsciiString &
	:rtype: None
") SetSource;
		void SetSource (const Handle_TCollection_HAsciiString & source);
};


%extend StepShape_LimitsAndFits {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_LimitsAndFits(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_LimitsAndFits::Handle_StepShape_LimitsAndFits %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_LimitsAndFits;
class Handle_StepShape_LimitsAndFits : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_LimitsAndFits();
        Handle_StepShape_LimitsAndFits(const Handle_StepShape_LimitsAndFits &aHandle);
        Handle_StepShape_LimitsAndFits(const StepShape_LimitsAndFits *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_LimitsAndFits DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_LimitsAndFits {
    StepShape_LimitsAndFits* _get_reference() {
    return (StepShape_LimitsAndFits*)$self->Access();
    }
};

%extend Handle_StepShape_LimitsAndFits {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_LimitsAndFits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_MeasureQualification;
class StepShape_MeasureQualification : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_MeasureQualification;
		%feature("autodoc", "	:rtype: None
") StepShape_MeasureQualification;
		 StepShape_MeasureQualification ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:param description:
	:type description: Handle_TCollection_HAsciiString &
	:param qualified_measure:
	:type qualified_measure: Handle_StepBasic_MeasureWithUnit &
	:param qualifiers:
	:type qualifiers: Handle_StepShape_HArray1OfValueQualifier &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & name,const Handle_TCollection_HAsciiString & description,const Handle_StepBasic_MeasureWithUnit & qualified_measure,const Handle_StepShape_HArray1OfValueQualifier & qualifiers);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param description:
	:type description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & description);
		%feature("compactdefaultargs") QualifiedMeasure;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MeasureWithUnit
") QualifiedMeasure;
		Handle_StepBasic_MeasureWithUnit QualifiedMeasure ();
		%feature("compactdefaultargs") SetQualifiedMeasure;
		%feature("autodoc", "	:param qualified_measure:
	:type qualified_measure: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetQualifiedMeasure;
		void SetQualifiedMeasure (const Handle_StepBasic_MeasureWithUnit & qualified_measure);
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfValueQualifier
") Qualifiers;
		Handle_StepShape_HArray1OfValueQualifier Qualifiers ();
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "	:rtype: int
") NbQualifiers;
		Standard_Integer NbQualifiers ();
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", "	:param qualifiers:
	:type qualifiers: Handle_StepShape_HArray1OfValueQualifier &
	:rtype: None
") SetQualifiers;
		void SetQualifiers (const Handle_StepShape_HArray1OfValueQualifier & qualifiers);
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepShape_ValueQualifier
") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:param aqualifier:
	:type aqualifier: StepShape_ValueQualifier &
	:rtype: None
") SetQualifiersValue;
		void SetQualifiersValue (const Standard_Integer num,const StepShape_ValueQualifier & aqualifier);
};


%extend StepShape_MeasureQualification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_MeasureQualification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_MeasureQualification::Handle_StepShape_MeasureQualification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_MeasureQualification;
class Handle_StepShape_MeasureQualification : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_MeasureQualification();
        Handle_StepShape_MeasureQualification(const Handle_StepShape_MeasureQualification &aHandle);
        Handle_StepShape_MeasureQualification(const StepShape_MeasureQualification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_MeasureQualification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_MeasureQualification {
    StepShape_MeasureQualification* _get_reference() {
    return (StepShape_MeasureQualification*)$self->Access();
    }
};

%extend Handle_StepShape_MeasureQualification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_MeasureQualification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
class StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
		%feature("autodoc", "	:rtype: None
") StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
		 StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aValueComponent:
	:type aValueComponent: Handle_StepBasic_MeasureValueMember &
	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:param qualifiers:
	:type qualifiers: Handle_StepShape_HArray1OfValueQualifier &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureValueMember & aValueComponent,const StepBasic_Unit & aUnitComponent,const Handle_StepShape_HArray1OfValueQualifier & qualifiers);
		%feature("compactdefaultargs") SetMeasure;
		%feature("autodoc", "	:param Measure:
	:type Measure: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetMeasure;
		void SetMeasure (const Handle_StepBasic_MeasureWithUnit & Measure);
		%feature("compactdefaultargs") Measure;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MeasureWithUnit
") Measure;
		Handle_StepBasic_MeasureWithUnit Measure ();
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfValueQualifier
") Qualifiers;
		Handle_StepShape_HArray1OfValueQualifier Qualifiers ();
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "	:rtype: int
") NbQualifiers;
		Standard_Integer NbQualifiers ();
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", "	:param qualifiers:
	:type qualifiers: Handle_StepShape_HArray1OfValueQualifier &
	:rtype: None
") SetQualifiers;
		void SetQualifiers (const Handle_StepShape_HArray1OfValueQualifier & qualifiers);
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepShape_ValueQualifier
") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:param aqualifier:
	:type aqualifier: StepShape_ValueQualifier &
	:rtype: None
") SetQualifiersValue;
		void SetQualifiersValue (const Standard_Integer num,const StepShape_ValueQualifier & aqualifier);
};


%extend StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem::Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
class Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem : public Handle_StepRepr_RepresentationItem {

    public:
        // constructors
        Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem();
        Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem(const Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem &aHandle);
        Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem(const StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem {
    StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem* _get_reference() {
    return (StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem*)$self->Access();
    }
};

%extend Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_PlusMinusTolerance;
class StepShape_PlusMinusTolerance : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_PlusMinusTolerance;
		%feature("autodoc", "	:rtype: None
") StepShape_PlusMinusTolerance;
		 StepShape_PlusMinusTolerance ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param range:
	:type range: StepShape_ToleranceMethodDefinition &
	:param toleranced_dimension:
	:type toleranced_dimension: StepShape_DimensionalCharacteristic &
	:rtype: None
") Init;
		void Init (const StepShape_ToleranceMethodDefinition & range,const StepShape_DimensionalCharacteristic & toleranced_dimension);
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	:rtype: StepShape_ToleranceMethodDefinition
") Range;
		StepShape_ToleranceMethodDefinition Range ();
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	:param range:
	:type range: StepShape_ToleranceMethodDefinition &
	:rtype: None
") SetRange;
		void SetRange (const StepShape_ToleranceMethodDefinition & range);
		%feature("compactdefaultargs") TolerancedDimension;
		%feature("autodoc", "	:rtype: StepShape_DimensionalCharacteristic
") TolerancedDimension;
		StepShape_DimensionalCharacteristic TolerancedDimension ();
		%feature("compactdefaultargs") SetTolerancedDimension;
		%feature("autodoc", "	:param toleranced_dimension:
	:type toleranced_dimension: StepShape_DimensionalCharacteristic &
	:rtype: None
") SetTolerancedDimension;
		void SetTolerancedDimension (const StepShape_DimensionalCharacteristic & toleranced_dimension);
};


%extend StepShape_PlusMinusTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_PlusMinusTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_PlusMinusTolerance::Handle_StepShape_PlusMinusTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_PlusMinusTolerance;
class Handle_StepShape_PlusMinusTolerance : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_PlusMinusTolerance();
        Handle_StepShape_PlusMinusTolerance(const Handle_StepShape_PlusMinusTolerance &aHandle);
        Handle_StepShape_PlusMinusTolerance(const StepShape_PlusMinusTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_PlusMinusTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_PlusMinusTolerance {
    StepShape_PlusMinusTolerance* _get_reference() {
    return (StepShape_PlusMinusTolerance*)$self->Access();
    }
};

%extend Handle_StepShape_PlusMinusTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_PlusMinusTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_PrecisionQualifier;
class StepShape_PrecisionQualifier : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_PrecisionQualifier;
		%feature("autodoc", "	:rtype: None
") StepShape_PrecisionQualifier;
		 StepShape_PrecisionQualifier ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param precision_value:
	:type precision_value: int
	:rtype: None
") Init;
		void Init (const Standard_Integer precision_value);
		%feature("compactdefaultargs") PrecisionValue;
		%feature("autodoc", "	:rtype: int
") PrecisionValue;
		Standard_Integer PrecisionValue ();
		%feature("compactdefaultargs") SetPrecisionValue;
		%feature("autodoc", "	:param precision_value:
	:type precision_value: int
	:rtype: None
") SetPrecisionValue;
		void SetPrecisionValue (const Standard_Integer precision_value);
};


%extend StepShape_PrecisionQualifier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_PrecisionQualifier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_PrecisionQualifier::Handle_StepShape_PrecisionQualifier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_PrecisionQualifier;
class Handle_StepShape_PrecisionQualifier : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_PrecisionQualifier();
        Handle_StepShape_PrecisionQualifier(const Handle_StepShape_PrecisionQualifier &aHandle);
        Handle_StepShape_PrecisionQualifier(const StepShape_PrecisionQualifier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_PrecisionQualifier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_PrecisionQualifier {
    StepShape_PrecisionQualifier* _get_reference() {
    return (StepShape_PrecisionQualifier*)$self->Access();
    }
};

%extend Handle_StepShape_PrecisionQualifier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_PrecisionQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_QualifiedRepresentationItem;
class StepShape_QualifiedRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_QualifiedRepresentationItem;
		%feature("autodoc", "	:rtype: None
") StepShape_QualifiedRepresentationItem;
		 StepShape_QualifiedRepresentationItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param qualifiers:
	:type qualifiers: Handle_StepShape_HArray1OfValueQualifier &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfValueQualifier & qualifiers);
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfValueQualifier
") Qualifiers;
		Handle_StepShape_HArray1OfValueQualifier Qualifiers ();
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "	:rtype: int
") NbQualifiers;
		Standard_Integer NbQualifiers ();
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", "	:param qualifiers:
	:type qualifiers: Handle_StepShape_HArray1OfValueQualifier &
	:rtype: None
") SetQualifiers;
		void SetQualifiers (const Handle_StepShape_HArray1OfValueQualifier & qualifiers);
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepShape_ValueQualifier
") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:param aqualifier:
	:type aqualifier: StepShape_ValueQualifier &
	:rtype: None
") SetQualifiersValue;
		void SetQualifiersValue (const Standard_Integer num,const StepShape_ValueQualifier & aqualifier);
};


%extend StepShape_QualifiedRepresentationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_QualifiedRepresentationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_QualifiedRepresentationItem::Handle_StepShape_QualifiedRepresentationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_QualifiedRepresentationItem;
class Handle_StepShape_QualifiedRepresentationItem : public Handle_StepRepr_RepresentationItem {

    public:
        // constructors
        Handle_StepShape_QualifiedRepresentationItem();
        Handle_StepShape_QualifiedRepresentationItem(const Handle_StepShape_QualifiedRepresentationItem &aHandle);
        Handle_StepShape_QualifiedRepresentationItem(const StepShape_QualifiedRepresentationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_QualifiedRepresentationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_QualifiedRepresentationItem {
    StepShape_QualifiedRepresentationItem* _get_reference() {
    return (StepShape_QualifiedRepresentationItem*)$self->Access();
    }
};

%extend Handle_StepShape_QualifiedRepresentationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_QualifiedRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ReversibleTopologyItem;
class StepShape_ReversibleTopologyItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepShape_ReversibleTopologyItem;
		%feature("autodoc", "	* Returns a ReversibleTopologyItem SelectType

	:rtype: None
") StepShape_ReversibleTopologyItem;
		 StepShape_ReversibleTopologyItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a ReversibleTopologyItem Kind Entity that is : 1 -> Edge 2 -> Path 3 -> Face 4 -> FaceBound 5 -> ClosedShell 6 -> OpenShell 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* returns Value as a Edge (Null if another type)

	:rtype: Handle_StepShape_Edge
") Edge;
		Handle_StepShape_Edge Edge ();
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	* returns Value as a Path (Null if another type)

	:rtype: Handle_StepShape_Path
") Path;
		Handle_StepShape_Path Path ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* returns Value as a Face (Null if another type)

	:rtype: Handle_StepShape_Face
") Face;
		Handle_StepShape_Face Face ();
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", "	* returns Value as a FaceBound (Null if another type)

	:rtype: Handle_StepShape_FaceBound
") FaceBound;
		Handle_StepShape_FaceBound FaceBound ();
		%feature("compactdefaultargs") ClosedShell;
		%feature("autodoc", "	* returns Value as a ClosedShell (Null if another type)

	:rtype: Handle_StepShape_ClosedShell
") ClosedShell;
		Handle_StepShape_ClosedShell ClosedShell ();
		%feature("compactdefaultargs") OpenShell;
		%feature("autodoc", "	* returns Value as a OpenShell (Null if another type)

	:rtype: Handle_StepShape_OpenShell
") OpenShell;
		Handle_StepShape_OpenShell OpenShell ();
};


%extend StepShape_ReversibleTopologyItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_RightAngularWedge;
class StepShape_RightAngularWedge : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_RightAngularWedge;
		%feature("autodoc", "	* Returns a RightAngularWedge

	:rtype: None
") StepShape_RightAngularWedge;
		 StepShape_RightAngularWedge ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:param aX:
	:type aX: float
	:param aY:
	:type aY: float
	:param aZ:
	:type aZ: float
	:param aLtx:
	:type aLtx: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition,const Standard_Real aX,const Standard_Real aY,const Standard_Real aZ,const Standard_Real aLtx);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:rtype: None
") SetPosition;
		void SetPosition (const Handle_StepGeom_Axis2Placement3d & aPosition);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis2Placement3d
") Position;
		Handle_StepGeom_Axis2Placement3d Position ();
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	:param aX:
	:type aX: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real aX);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	:param aY:
	:type aY: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real aY);
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "	:param aZ:
	:type aZ: float
	:rtype: None
") SetZ;
		void SetZ (const Standard_Real aZ);
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") SetLtx;
		%feature("autodoc", "	:param aLtx:
	:type aLtx: float
	:rtype: None
") SetLtx;
		void SetLtx (const Standard_Real aLtx);
		%feature("compactdefaultargs") Ltx;
		%feature("autodoc", "	:rtype: float
") Ltx;
		Standard_Real Ltx ();
};


%extend StepShape_RightAngularWedge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_RightAngularWedge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_RightAngularWedge::Handle_StepShape_RightAngularWedge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_RightAngularWedge;
class Handle_StepShape_RightAngularWedge : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_RightAngularWedge();
        Handle_StepShape_RightAngularWedge(const Handle_StepShape_RightAngularWedge &aHandle);
        Handle_StepShape_RightAngularWedge(const StepShape_RightAngularWedge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_RightAngularWedge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_RightAngularWedge {
    StepShape_RightAngularWedge* _get_reference() {
    return (StepShape_RightAngularWedge*)$self->Access();
    }
};

%extend Handle_StepShape_RightAngularWedge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_RightAngularWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_RightCircularCone;
class StepShape_RightCircularCone : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_RightCircularCone;
		%feature("autodoc", "	* Returns a RightCircularCone

	:rtype: None
") StepShape_RightCircularCone;
		 StepShape_RightCircularCone ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis1Placement &
	:param aHeight:
	:type aHeight: float
	:param aRadius:
	:type aRadius: float
	:param aSemiAngle:
	:type aSemiAngle: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis1Placement & aPosition,const Standard_Real aHeight,const Standard_Real aRadius,const Standard_Real aSemiAngle);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis1Placement &
	:rtype: None
") SetPosition;
		void SetPosition (const Handle_StepGeom_Axis1Placement & aPosition);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis1Placement
") Position;
		Handle_StepGeom_Axis1Placement Position ();
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	:rtype: float
") Height;
		Standard_Real Height ();
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "	:param aSemiAngle:
	:type aSemiAngle: float
	:rtype: None
") SetSemiAngle;
		void SetSemiAngle (const Standard_Real aSemiAngle);
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "	:rtype: float
") SemiAngle;
		Standard_Real SemiAngle ();
};


%extend StepShape_RightCircularCone {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_RightCircularCone(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_RightCircularCone::Handle_StepShape_RightCircularCone %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_RightCircularCone;
class Handle_StepShape_RightCircularCone : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_RightCircularCone();
        Handle_StepShape_RightCircularCone(const Handle_StepShape_RightCircularCone &aHandle);
        Handle_StepShape_RightCircularCone(const StepShape_RightCircularCone *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_RightCircularCone DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_RightCircularCone {
    StepShape_RightCircularCone* _get_reference() {
    return (StepShape_RightCircularCone*)$self->Access();
    }
};

%extend Handle_StepShape_RightCircularCone {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_RightCircularCone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_RightCircularCylinder;
class StepShape_RightCircularCylinder : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_RightCircularCylinder;
		%feature("autodoc", "	* Returns a RightCircularCylinder

	:rtype: None
") StepShape_RightCircularCylinder;
		 StepShape_RightCircularCylinder ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis1Placement &
	:param aHeight:
	:type aHeight: float
	:param aRadius:
	:type aRadius: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis1Placement & aPosition,const Standard_Real aHeight,const Standard_Real aRadius);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis1Placement &
	:rtype: None
") SetPosition;
		void SetPosition (const Handle_StepGeom_Axis1Placement & aPosition);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis1Placement
") Position;
		Handle_StepGeom_Axis1Placement Position ();
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	:rtype: float
") Height;
		Standard_Real Height ();
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
};


%extend StepShape_RightCircularCylinder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_RightCircularCylinder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_RightCircularCylinder::Handle_StepShape_RightCircularCylinder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_RightCircularCylinder;
class Handle_StepShape_RightCircularCylinder : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_RightCircularCylinder();
        Handle_StepShape_RightCircularCylinder(const Handle_StepShape_RightCircularCylinder &aHandle);
        Handle_StepShape_RightCircularCylinder(const StepShape_RightCircularCylinder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_RightCircularCylinder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_RightCircularCylinder {
    StepShape_RightCircularCylinder* _get_reference() {
    return (StepShape_RightCircularCylinder*)$self->Access();
    }
};

%extend Handle_StepShape_RightCircularCylinder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_RightCircularCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ShapeDefinitionRepresentation;
class StepShape_ShapeDefinitionRepresentation : public StepRepr_PropertyDefinitionRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_ShapeDefinitionRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_ShapeDefinitionRepresentation;
		 StepShape_ShapeDefinitionRepresentation ();
};


%extend StepShape_ShapeDefinitionRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ShapeDefinitionRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ShapeDefinitionRepresentation::Handle_StepShape_ShapeDefinitionRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ShapeDefinitionRepresentation;
class Handle_StepShape_ShapeDefinitionRepresentation : public Handle_StepRepr_PropertyDefinitionRepresentation {

    public:
        // constructors
        Handle_StepShape_ShapeDefinitionRepresentation();
        Handle_StepShape_ShapeDefinitionRepresentation(const Handle_StepShape_ShapeDefinitionRepresentation &aHandle);
        Handle_StepShape_ShapeDefinitionRepresentation(const StepShape_ShapeDefinitionRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ShapeDefinitionRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ShapeDefinitionRepresentation {
    StepShape_ShapeDefinitionRepresentation* _get_reference() {
    return (StepShape_ShapeDefinitionRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_ShapeDefinitionRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ShapeDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ShapeRepresentation;
class StepShape_ShapeRepresentation : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepShape_ShapeRepresentation;
		%feature("autodoc", "	* Returns a ShapeRepresentation

	:rtype: None
") StepShape_ShapeRepresentation;
		 StepShape_ShapeRepresentation ();
};


%extend StepShape_ShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ShapeRepresentation::Handle_StepShape_ShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ShapeRepresentation;
class Handle_StepShape_ShapeRepresentation : public Handle_StepRepr_Representation {

    public:
        // constructors
        Handle_StepShape_ShapeRepresentation();
        Handle_StepShape_ShapeRepresentation(const Handle_StepShape_ShapeRepresentation &aHandle);
        Handle_StepShape_ShapeRepresentation(const StepShape_ShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ShapeRepresentation {
    StepShape_ShapeRepresentation* _get_reference() {
    return (StepShape_ShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_ShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Shell;
class StepShape_Shell : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepShape_Shell;
		%feature("autodoc", "	* Returns a Shell SelectType

	:rtype: None
") StepShape_Shell;
		 StepShape_Shell ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a Shell Kind Entity that is : 1 -> OpenShell 2 -> ClosedShell 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") OpenShell;
		%feature("autodoc", "	* returns Value as a OpenShell (Null if another type)

	:rtype: Handle_StepShape_OpenShell
") OpenShell;
		Handle_StepShape_OpenShell OpenShell ();
		%feature("compactdefaultargs") ClosedShell;
		%feature("autodoc", "	* returns Value as a ClosedShell (Null if another type)

	:rtype: Handle_StepShape_ClosedShell
") ClosedShell;
		Handle_StepShape_ClosedShell ClosedShell ();
};


%extend StepShape_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ShellBasedSurfaceModel;
class StepShape_ShellBasedSurfaceModel : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_ShellBasedSurfaceModel;
		%feature("autodoc", "	* Returns a ShellBasedSurfaceModel

	:rtype: None
") StepShape_ShellBasedSurfaceModel;
		 StepShape_ShellBasedSurfaceModel ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSbsmBoundary:
	:type aSbsmBoundary: Handle_StepShape_HArray1OfShell &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfShell & aSbsmBoundary);
		%feature("compactdefaultargs") SetSbsmBoundary;
		%feature("autodoc", "	:param aSbsmBoundary:
	:type aSbsmBoundary: Handle_StepShape_HArray1OfShell &
	:rtype: None
") SetSbsmBoundary;
		void SetSbsmBoundary (const Handle_StepShape_HArray1OfShell & aSbsmBoundary);
		%feature("compactdefaultargs") SbsmBoundary;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfShell
") SbsmBoundary;
		Handle_StepShape_HArray1OfShell SbsmBoundary ();
		%feature("compactdefaultargs") SbsmBoundaryValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepShape_Shell
") SbsmBoundaryValue;
		StepShape_Shell SbsmBoundaryValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbSbsmBoundary;
		%feature("autodoc", "	:rtype: int
") NbSbsmBoundary;
		Standard_Integer NbSbsmBoundary ();
};


%extend StepShape_ShellBasedSurfaceModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ShellBasedSurfaceModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ShellBasedSurfaceModel::Handle_StepShape_ShellBasedSurfaceModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ShellBasedSurfaceModel;
class Handle_StepShape_ShellBasedSurfaceModel : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_ShellBasedSurfaceModel();
        Handle_StepShape_ShellBasedSurfaceModel(const Handle_StepShape_ShellBasedSurfaceModel &aHandle);
        Handle_StepShape_ShellBasedSurfaceModel(const StepShape_ShellBasedSurfaceModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ShellBasedSurfaceModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ShellBasedSurfaceModel {
    StepShape_ShellBasedSurfaceModel* _get_reference() {
    return (StepShape_ShellBasedSurfaceModel*)$self->Access();
    }
};

%extend Handle_StepShape_ShellBasedSurfaceModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ShellBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_SolidModel;
class StepShape_SolidModel : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_SolidModel;
		%feature("autodoc", "	* Returns a SolidModel

	:rtype: None
") StepShape_SolidModel;
		 StepShape_SolidModel ();
};


%extend StepShape_SolidModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_SolidModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_SolidModel::Handle_StepShape_SolidModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_SolidModel;
class Handle_StepShape_SolidModel : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_SolidModel();
        Handle_StepShape_SolidModel(const Handle_StepShape_SolidModel &aHandle);
        Handle_StepShape_SolidModel(const StepShape_SolidModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_SolidModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_SolidModel {
    StepShape_SolidModel* _get_reference() {
    return (StepShape_SolidModel*)$self->Access();
    }
};

%extend Handle_StepShape_SolidModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_SolidModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Sphere;
class StepShape_Sphere : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_Sphere;
		%feature("autodoc", "	* Returns a Sphere

	:rtype: None
") StepShape_Sphere;
		 StepShape_Sphere ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aRadius:
	:type aRadius: float
	:param aCentre:
	:type aCentre: Handle_StepGeom_Point &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Real aRadius,const Handle_StepGeom_Point & aCentre);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") SetCentre;
		%feature("autodoc", "	:param aCentre:
	:type aCentre: Handle_StepGeom_Point &
	:rtype: None
") SetCentre;
		void SetCentre (const Handle_StepGeom_Point & aCentre);
		%feature("compactdefaultargs") Centre;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Point
") Centre;
		Handle_StepGeom_Point Centre ();
};


%extend StepShape_Sphere {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Sphere(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Sphere::Handle_StepShape_Sphere %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Sphere;
class Handle_StepShape_Sphere : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_Sphere();
        Handle_StepShape_Sphere(const Handle_StepShape_Sphere &aHandle);
        Handle_StepShape_Sphere(const StepShape_Sphere *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Sphere DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Sphere {
    StepShape_Sphere* _get_reference() {
    return (StepShape_Sphere*)$self->Access();
    }
};

%extend Handle_StepShape_Sphere {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_SurfaceModel;
class StepShape_SurfaceModel : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepShape_SurfaceModel;
		%feature("autodoc", "	* Returns a SurfaceModel SelectType

	:rtype: None
") StepShape_SurfaceModel;
		 StepShape_SurfaceModel ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a SurfaceModel Kind Entity that is : 1 -> ShellBasedSurfaceModel 2 -> FaceBasedSurfaceModel 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ShellBasedSurfaceModel;
		%feature("autodoc", "	* returns Value as a ShellBasedSurfaceModel (Null if another type)

	:rtype: Handle_StepShape_ShellBasedSurfaceModel
") ShellBasedSurfaceModel;
		Handle_StepShape_ShellBasedSurfaceModel ShellBasedSurfaceModel ();
};


%extend StepShape_SurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ToleranceMethodDefinition;
class StepShape_ToleranceMethodDefinition : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepShape_ToleranceMethodDefinition;
		%feature("autodoc", "	:rtype: None
") StepShape_ToleranceMethodDefinition;
		 StepShape_ToleranceMethodDefinition ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ValueQualifier Select Type : 1 -> ToleranceValue from StepShape 2 -> LimitsAndFits from StepShape

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ToleranceValue;
		%feature("autodoc", "	* Returns Value as ToleranceValue

	:rtype: Handle_StepShape_ToleranceValue
") ToleranceValue;
		Handle_StepShape_ToleranceValue ToleranceValue ();
		%feature("compactdefaultargs") LimitsAndFits;
		%feature("autodoc", "	* Returns Value as LimitsAndFits

	:rtype: Handle_StepShape_LimitsAndFits
") LimitsAndFits;
		Handle_StepShape_LimitsAndFits LimitsAndFits ();
};


%extend StepShape_ToleranceMethodDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ToleranceValue;
class StepShape_ToleranceValue : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_ToleranceValue;
		%feature("autodoc", "	:rtype: None
") StepShape_ToleranceValue;
		 StepShape_ToleranceValue ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower_bound:
	:type lower_bound: Handle_StepBasic_MeasureWithUnit &
	:param upper_bound:
	:type upper_bound: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_MeasureWithUnit & lower_bound,const Handle_StepBasic_MeasureWithUnit & upper_bound);
		%feature("compactdefaultargs") LowerBound;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MeasureWithUnit
") LowerBound;
		Handle_StepBasic_MeasureWithUnit LowerBound ();
		%feature("compactdefaultargs") SetLowerBound;
		%feature("autodoc", "	:param lower_bound:
	:type lower_bound: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetLowerBound;
		void SetLowerBound (const Handle_StepBasic_MeasureWithUnit & lower_bound);
		%feature("compactdefaultargs") UpperBound;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MeasureWithUnit
") UpperBound;
		Handle_StepBasic_MeasureWithUnit UpperBound ();
		%feature("compactdefaultargs") SetUpperBound;
		%feature("autodoc", "	:param upper_bound:
	:type upper_bound: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetUpperBound;
		void SetUpperBound (const Handle_StepBasic_MeasureWithUnit & upper_bound);
};


%extend StepShape_ToleranceValue {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ToleranceValue(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ToleranceValue::Handle_StepShape_ToleranceValue %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ToleranceValue;
class Handle_StepShape_ToleranceValue : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_ToleranceValue();
        Handle_StepShape_ToleranceValue(const Handle_StepShape_ToleranceValue &aHandle);
        Handle_StepShape_ToleranceValue(const StepShape_ToleranceValue *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ToleranceValue DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ToleranceValue {
    StepShape_ToleranceValue* _get_reference() {
    return (StepShape_ToleranceValue*)$self->Access();
    }
};

%extend Handle_StepShape_ToleranceValue {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ToleranceValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_TopologicalRepresentationItem;
class StepShape_TopologicalRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_TopologicalRepresentationItem;
		%feature("autodoc", "	* Returns a TopologicalRepresentationItem

	:rtype: None
") StepShape_TopologicalRepresentationItem;
		 StepShape_TopologicalRepresentationItem ();
};


%extend StepShape_TopologicalRepresentationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_TopologicalRepresentationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_TopologicalRepresentationItem::Handle_StepShape_TopologicalRepresentationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_TopologicalRepresentationItem;
class Handle_StepShape_TopologicalRepresentationItem : public Handle_StepRepr_RepresentationItem {

    public:
        // constructors
        Handle_StepShape_TopologicalRepresentationItem();
        Handle_StepShape_TopologicalRepresentationItem(const Handle_StepShape_TopologicalRepresentationItem &aHandle);
        Handle_StepShape_TopologicalRepresentationItem(const StepShape_TopologicalRepresentationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_TopologicalRepresentationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_TopologicalRepresentationItem {
    StepShape_TopologicalRepresentationItem* _get_reference() {
    return (StepShape_TopologicalRepresentationItem*)$self->Access();
    }
};

%extend Handle_StepShape_TopologicalRepresentationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_TopologicalRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Torus;
class StepShape_Torus : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_Torus;
		%feature("autodoc", "	* Returns a Torus

	:rtype: None
") StepShape_Torus;
		 StepShape_Torus ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis1Placement &
	:param aMajorRadius:
	:type aMajorRadius: float
	:param aMinorRadius:
	:type aMinorRadius: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis1Placement & aPosition,const Standard_Real aMajorRadius,const Standard_Real aMinorRadius);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis1Placement &
	:rtype: None
") SetPosition;
		void SetPosition (const Handle_StepGeom_Axis1Placement & aPosition);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis1Placement
") Position;
		Handle_StepGeom_Axis1Placement Position ();
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "	:param aMajorRadius:
	:type aMajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius (const Standard_Real aMajorRadius);
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "	:param aMinorRadius:
	:type aMinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius (const Standard_Real aMinorRadius);
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius ();
};


%extend StepShape_Torus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Torus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Torus::Handle_StepShape_Torus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Torus;
class Handle_StepShape_Torus : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepShape_Torus();
        Handle_StepShape_Torus(const Handle_StepShape_Torus &aHandle);
        Handle_StepShape_Torus(const StepShape_Torus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Torus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Torus {
    StepShape_Torus* _get_reference() {
    return (StepShape_Torus*)$self->Access();
    }
};

%extend Handle_StepShape_Torus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_TypeQualifier;
class StepShape_TypeQualifier : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepShape_TypeQualifier;
		%feature("autodoc", "	:rtype: None
") StepShape_TypeQualifier;
		 StepShape_TypeQualifier ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & name);
};


%extend StepShape_TypeQualifier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_TypeQualifier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_TypeQualifier::Handle_StepShape_TypeQualifier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_TypeQualifier;
class Handle_StepShape_TypeQualifier : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepShape_TypeQualifier();
        Handle_StepShape_TypeQualifier(const Handle_StepShape_TypeQualifier &aHandle);
        Handle_StepShape_TypeQualifier(const StepShape_TypeQualifier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_TypeQualifier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_TypeQualifier {
    StepShape_TypeQualifier* _get_reference() {
    return (StepShape_TypeQualifier*)$self->Access();
    }
};

%extend Handle_StepShape_TypeQualifier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_TypeQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ValueQualifier;
class StepShape_ValueQualifier : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepShape_ValueQualifier;
		%feature("autodoc", "	:rtype: None
") StepShape_ValueQualifier;
		 StepShape_ValueQualifier ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ValueQualifier Select Type : 1 -> PrecisionQualifier from StepShape 2 -> TypeQualifier from StepShape 3 -> UnceraintyQualifier .. not yet implemented

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PrecisionQualifier;
		%feature("autodoc", "	* Returns Value as PrecisionQualifier

	:rtype: Handle_StepShape_PrecisionQualifier
") PrecisionQualifier;
		Handle_StepShape_PrecisionQualifier PrecisionQualifier ();
		%feature("compactdefaultargs") TypeQualifier;
		%feature("autodoc", "	* Returns Value as TypeQualifier

	:rtype: Handle_StepShape_TypeQualifier
") TypeQualifier;
		Handle_StepShape_TypeQualifier TypeQualifier ();
};


%extend StepShape_ValueQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_AdvancedBrepShapeRepresentation;
class StepShape_AdvancedBrepShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_AdvancedBrepShapeRepresentation;
		%feature("autodoc", "	* Returns a AdvancedBrepShapeRepresentation

	:rtype: None
") StepShape_AdvancedBrepShapeRepresentation;
		 StepShape_AdvancedBrepShapeRepresentation ();
};


%extend StepShape_AdvancedBrepShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_AdvancedBrepShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_AdvancedBrepShapeRepresentation::Handle_StepShape_AdvancedBrepShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_AdvancedBrepShapeRepresentation;
class Handle_StepShape_AdvancedBrepShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_AdvancedBrepShapeRepresentation();
        Handle_StepShape_AdvancedBrepShapeRepresentation(const Handle_StepShape_AdvancedBrepShapeRepresentation &aHandle);
        Handle_StepShape_AdvancedBrepShapeRepresentation(const StepShape_AdvancedBrepShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_AdvancedBrepShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_AdvancedBrepShapeRepresentation {
    StepShape_AdvancedBrepShapeRepresentation* _get_reference() {
    return (StepShape_AdvancedBrepShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_AdvancedBrepShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_AdvancedBrepShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_AngularLocation;
class StepShape_AngularLocation : public StepShape_DimensionalLocation {
	public:
		%feature("compactdefaultargs") StepShape_AngularLocation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_AngularLocation;
		 StepShape_AngularLocation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aShapeAspectRelationship_Name:
	:type aShapeAspectRelationship_Name: Handle_TCollection_HAsciiString &
	:param hasShapeAspectRelationship_Description:
	:type hasShapeAspectRelationship_Description: bool
	:param aShapeAspectRelationship_Description:
	:type aShapeAspectRelationship_Description: Handle_TCollection_HAsciiString &
	:param aShapeAspectRelationship_RelatingShapeAspect:
	:type aShapeAspectRelationship_RelatingShapeAspect: Handle_StepRepr_ShapeAspect &
	:param aShapeAspectRelationship_RelatedShapeAspect:
	:type aShapeAspectRelationship_RelatedShapeAspect: Handle_StepRepr_ShapeAspect &
	:param aAngleSelection:
	:type aAngleSelection: StepShape_AngleRelator
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aShapeAspectRelationship_Name,const Standard_Boolean hasShapeAspectRelationship_Description,const Handle_TCollection_HAsciiString & aShapeAspectRelationship_Description,const Handle_StepRepr_ShapeAspect & aShapeAspectRelationship_RelatingShapeAspect,const Handle_StepRepr_ShapeAspect & aShapeAspectRelationship_RelatedShapeAspect,const StepShape_AngleRelator aAngleSelection);
		%feature("compactdefaultargs") AngleSelection;
		%feature("autodoc", "	* Returns field AngleSelection

	:rtype: StepShape_AngleRelator
") AngleSelection;
		StepShape_AngleRelator AngleSelection ();
		%feature("compactdefaultargs") SetAngleSelection;
		%feature("autodoc", "	* Set field AngleSelection

	:param AngleSelection:
	:type AngleSelection: StepShape_AngleRelator
	:rtype: None
") SetAngleSelection;
		void SetAngleSelection (const StepShape_AngleRelator AngleSelection);
};


%extend StepShape_AngularLocation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_AngularLocation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_AngularLocation::Handle_StepShape_AngularLocation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_AngularLocation;
class Handle_StepShape_AngularLocation : public Handle_StepShape_DimensionalLocation {

    public:
        // constructors
        Handle_StepShape_AngularLocation();
        Handle_StepShape_AngularLocation(const Handle_StepShape_AngularLocation &aHandle);
        Handle_StepShape_AngularLocation(const StepShape_AngularLocation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_AngularLocation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_AngularLocation {
    StepShape_AngularLocation* _get_reference() {
    return (StepShape_AngularLocation*)$self->Access();
    }
};

%extend Handle_StepShape_AngularLocation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_AngularLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_AngularSize;
class StepShape_AngularSize : public StepShape_DimensionalSize {
	public:
		%feature("compactdefaultargs") StepShape_AngularSize;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_AngularSize;
		 StepShape_AngularSize ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDimensionalSize_AppliesTo:
	:type aDimensionalSize_AppliesTo: Handle_StepRepr_ShapeAspect &
	:param aDimensionalSize_Name:
	:type aDimensionalSize_Name: Handle_TCollection_HAsciiString &
	:param aAngleSelection:
	:type aAngleSelection: StepShape_AngleRelator
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_ShapeAspect & aDimensionalSize_AppliesTo,const Handle_TCollection_HAsciiString & aDimensionalSize_Name,const StepShape_AngleRelator aAngleSelection);
		%feature("compactdefaultargs") AngleSelection;
		%feature("autodoc", "	* Returns field AngleSelection

	:rtype: StepShape_AngleRelator
") AngleSelection;
		StepShape_AngleRelator AngleSelection ();
		%feature("compactdefaultargs") SetAngleSelection;
		%feature("autodoc", "	* Set field AngleSelection

	:param AngleSelection:
	:type AngleSelection: StepShape_AngleRelator
	:rtype: None
") SetAngleSelection;
		void SetAngleSelection (const StepShape_AngleRelator AngleSelection);
};


%extend StepShape_AngularSize {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_AngularSize(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_AngularSize::Handle_StepShape_AngularSize %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_AngularSize;
class Handle_StepShape_AngularSize : public Handle_StepShape_DimensionalSize {

    public:
        // constructors
        Handle_StepShape_AngularSize();
        Handle_StepShape_AngularSize(const Handle_StepShape_AngularSize &aHandle);
        Handle_StepShape_AngularSize(const StepShape_AngularSize *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_AngularSize DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_AngularSize {
    StepShape_AngularSize* _get_reference() {
    return (StepShape_AngularSize*)$self->Access();
    }
};

%extend Handle_StepShape_AngularSize {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_AngularSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_BoxedHalfSpace;
class StepShape_BoxedHalfSpace : public StepShape_HalfSpaceSolid {
	public:
		%feature("compactdefaultargs") StepShape_BoxedHalfSpace;
		%feature("autodoc", "	* Returns a BoxedHalfSpace

	:rtype: None
") StepShape_BoxedHalfSpace;
		 StepShape_BoxedHalfSpace ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBaseSurface:
	:type aBaseSurface: Handle_StepGeom_Surface &
	:param aAgreementFlag:
	:type aAgreementFlag: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBaseSurface,const Standard_Boolean aAgreementFlag);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBaseSurface:
	:type aBaseSurface: Handle_StepGeom_Surface &
	:param aAgreementFlag:
	:type aAgreementFlag: bool
	:param aEnclosure:
	:type aEnclosure: Handle_StepShape_BoxDomain &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBaseSurface,const Standard_Boolean aAgreementFlag,const Handle_StepShape_BoxDomain & aEnclosure);
		%feature("compactdefaultargs") SetEnclosure;
		%feature("autodoc", "	:param aEnclosure:
	:type aEnclosure: Handle_StepShape_BoxDomain &
	:rtype: None
") SetEnclosure;
		void SetEnclosure (const Handle_StepShape_BoxDomain & aEnclosure);
		%feature("compactdefaultargs") Enclosure;
		%feature("autodoc", "	:rtype: Handle_StepShape_BoxDomain
") Enclosure;
		Handle_StepShape_BoxDomain Enclosure ();
};


%extend StepShape_BoxedHalfSpace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_BoxedHalfSpace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_BoxedHalfSpace::Handle_StepShape_BoxedHalfSpace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_BoxedHalfSpace;
class Handle_StepShape_BoxedHalfSpace : public Handle_StepShape_HalfSpaceSolid {

    public:
        // constructors
        Handle_StepShape_BoxedHalfSpace();
        Handle_StepShape_BoxedHalfSpace(const Handle_StepShape_BoxedHalfSpace &aHandle);
        Handle_StepShape_BoxedHalfSpace(const StepShape_BoxedHalfSpace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_BoxedHalfSpace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_BoxedHalfSpace {
    StepShape_BoxedHalfSpace* _get_reference() {
    return (StepShape_BoxedHalfSpace*)$self->Access();
    }
};

%extend Handle_StepShape_BoxedHalfSpace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_BoxedHalfSpace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_CompoundShapeRepresentation;
class StepShape_CompoundShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_CompoundShapeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_CompoundShapeRepresentation;
		 StepShape_CompoundShapeRepresentation ();
};


%extend StepShape_CompoundShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_CompoundShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_CompoundShapeRepresentation::Handle_StepShape_CompoundShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_CompoundShapeRepresentation;
class Handle_StepShape_CompoundShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_CompoundShapeRepresentation();
        Handle_StepShape_CompoundShapeRepresentation(const Handle_StepShape_CompoundShapeRepresentation &aHandle);
        Handle_StepShape_CompoundShapeRepresentation(const StepShape_CompoundShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_CompoundShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_CompoundShapeRepresentation {
    StepShape_CompoundShapeRepresentation* _get_reference() {
    return (StepShape_CompoundShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_CompoundShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_CompoundShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ConnectedEdgeSet;
class StepShape_ConnectedEdgeSet : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_ConnectedEdgeSet;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_ConnectedEdgeSet;
		 StepShape_ConnectedEdgeSet ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aCesEdges:
	:type aCesEdges: Handle_StepShape_HArray1OfEdge &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepShape_HArray1OfEdge & aCesEdges);
		%feature("compactdefaultargs") CesEdges;
		%feature("autodoc", "	* Returns field CesEdges

	:rtype: Handle_StepShape_HArray1OfEdge
") CesEdges;
		Handle_StepShape_HArray1OfEdge CesEdges ();
		%feature("compactdefaultargs") SetCesEdges;
		%feature("autodoc", "	* Set field CesEdges

	:param CesEdges:
	:type CesEdges: Handle_StepShape_HArray1OfEdge &
	:rtype: None
") SetCesEdges;
		void SetCesEdges (const Handle_StepShape_HArray1OfEdge & CesEdges);
};


%extend StepShape_ConnectedEdgeSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ConnectedEdgeSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ConnectedEdgeSet::Handle_StepShape_ConnectedEdgeSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ConnectedEdgeSet;
class Handle_StepShape_ConnectedEdgeSet : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_ConnectedEdgeSet();
        Handle_StepShape_ConnectedEdgeSet(const Handle_StepShape_ConnectedEdgeSet &aHandle);
        Handle_StepShape_ConnectedEdgeSet(const StepShape_ConnectedEdgeSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ConnectedEdgeSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ConnectedEdgeSet {
    StepShape_ConnectedEdgeSet* _get_reference() {
    return (StepShape_ConnectedEdgeSet*)$self->Access();
    }
};

%extend Handle_StepShape_ConnectedEdgeSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ConnectedEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ConnectedFaceSet;
class StepShape_ConnectedFaceSet : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_ConnectedFaceSet;
		%feature("autodoc", "	* Returns a ConnectedFaceSet

	:rtype: None
") StepShape_ConnectedFaceSet;
		 StepShape_ConnectedFaceSet ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCfsFaces:
	:type aCfsFaces: Handle_StepShape_HArray1OfFace &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfFace & aCfsFaces);
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", "	:param aCfsFaces:
	:type aCfsFaces: Handle_StepShape_HArray1OfFace &
	:rtype: void
") SetCfsFaces;
		virtual void SetCfsFaces (const Handle_StepShape_HArray1OfFace & aCfsFaces);
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfFace
") CfsFaces;
		virtual Handle_StepShape_HArray1OfFace CfsFaces ();
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_Face
") CfsFacesValue;
		virtual Handle_StepShape_Face CfsFacesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "	:rtype: int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces ();
};


%extend StepShape_ConnectedFaceSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ConnectedFaceSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ConnectedFaceSet::Handle_StepShape_ConnectedFaceSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ConnectedFaceSet;
class Handle_StepShape_ConnectedFaceSet : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_ConnectedFaceSet();
        Handle_StepShape_ConnectedFaceSet(const Handle_StepShape_ConnectedFaceSet &aHandle);
        Handle_StepShape_ConnectedFaceSet(const StepShape_ConnectedFaceSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ConnectedFaceSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ConnectedFaceSet {
    StepShape_ConnectedFaceSet* _get_reference() {
    return (StepShape_ConnectedFaceSet*)$self->Access();
    }
};

%extend Handle_StepShape_ConnectedFaceSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ConnectedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_CsgShapeRepresentation;
class StepShape_CsgShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_CsgShapeRepresentation;
		%feature("autodoc", "	* Returns a CsgShapeRepresentation

	:rtype: None
") StepShape_CsgShapeRepresentation;
		 StepShape_CsgShapeRepresentation ();
};


%extend StepShape_CsgShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_CsgShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_CsgShapeRepresentation::Handle_StepShape_CsgShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_CsgShapeRepresentation;
class Handle_StepShape_CsgShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_CsgShapeRepresentation();
        Handle_StepShape_CsgShapeRepresentation(const Handle_StepShape_CsgShapeRepresentation &aHandle);
        Handle_StepShape_CsgShapeRepresentation(const StepShape_CsgShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_CsgShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_CsgShapeRepresentation {
    StepShape_CsgShapeRepresentation* _get_reference() {
    return (StepShape_CsgShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_CsgShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_CsgShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_CsgSolid;
class StepShape_CsgSolid : public StepShape_SolidModel {
	public:
		%feature("compactdefaultargs") StepShape_CsgSolid;
		%feature("autodoc", "	* Returns a CsgSolid

	:rtype: None
") StepShape_CsgSolid;
		 StepShape_CsgSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aTreeRootExpression:
	:type aTreeRootExpression: StepShape_CsgSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepShape_CsgSelect & aTreeRootExpression);
		%feature("compactdefaultargs") SetTreeRootExpression;
		%feature("autodoc", "	:param aTreeRootExpression:
	:type aTreeRootExpression: StepShape_CsgSelect &
	:rtype: None
") SetTreeRootExpression;
		void SetTreeRootExpression (const StepShape_CsgSelect & aTreeRootExpression);
		%feature("compactdefaultargs") TreeRootExpression;
		%feature("autodoc", "	:rtype: StepShape_CsgSelect
") TreeRootExpression;
		StepShape_CsgSelect TreeRootExpression ();
};


%extend StepShape_CsgSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_CsgSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_CsgSolid::Handle_StepShape_CsgSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_CsgSolid;
class Handle_StepShape_CsgSolid : public Handle_StepShape_SolidModel {

    public:
        // constructors
        Handle_StepShape_CsgSolid();
        Handle_StepShape_CsgSolid(const Handle_StepShape_CsgSolid &aHandle);
        Handle_StepShape_CsgSolid(const StepShape_CsgSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_CsgSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_CsgSolid {
    StepShape_CsgSolid* _get_reference() {
    return (StepShape_CsgSolid*)$self->Access();
    }
};

%extend Handle_StepShape_CsgSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_CsgSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_DimensionalLocationWithPath;
class StepShape_DimensionalLocationWithPath : public StepShape_DimensionalLocation {
	public:
		%feature("compactdefaultargs") StepShape_DimensionalLocationWithPath;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_DimensionalLocationWithPath;
		 StepShape_DimensionalLocationWithPath ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aShapeAspectRelationship_Name:
	:type aShapeAspectRelationship_Name: Handle_TCollection_HAsciiString &
	:param hasShapeAspectRelationship_Description:
	:type hasShapeAspectRelationship_Description: bool
	:param aShapeAspectRelationship_Description:
	:type aShapeAspectRelationship_Description: Handle_TCollection_HAsciiString &
	:param aShapeAspectRelationship_RelatingShapeAspect:
	:type aShapeAspectRelationship_RelatingShapeAspect: Handle_StepRepr_ShapeAspect &
	:param aShapeAspectRelationship_RelatedShapeAspect:
	:type aShapeAspectRelationship_RelatedShapeAspect: Handle_StepRepr_ShapeAspect &
	:param aPath:
	:type aPath: Handle_StepRepr_ShapeAspect &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aShapeAspectRelationship_Name,const Standard_Boolean hasShapeAspectRelationship_Description,const Handle_TCollection_HAsciiString & aShapeAspectRelationship_Description,const Handle_StepRepr_ShapeAspect & aShapeAspectRelationship_RelatingShapeAspect,const Handle_StepRepr_ShapeAspect & aShapeAspectRelationship_RelatedShapeAspect,const Handle_StepRepr_ShapeAspect & aPath);
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	* Returns field Path

	:rtype: Handle_StepRepr_ShapeAspect
") Path;
		Handle_StepRepr_ShapeAspect Path ();
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "	* Set field Path

	:param Path:
	:type Path: Handle_StepRepr_ShapeAspect &
	:rtype: None
") SetPath;
		void SetPath (const Handle_StepRepr_ShapeAspect & Path);
};


%extend StepShape_DimensionalLocationWithPath {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_DimensionalLocationWithPath(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_DimensionalLocationWithPath::Handle_StepShape_DimensionalLocationWithPath %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_DimensionalLocationWithPath;
class Handle_StepShape_DimensionalLocationWithPath : public Handle_StepShape_DimensionalLocation {

    public:
        // constructors
        Handle_StepShape_DimensionalLocationWithPath();
        Handle_StepShape_DimensionalLocationWithPath(const Handle_StepShape_DimensionalLocationWithPath &aHandle);
        Handle_StepShape_DimensionalLocationWithPath(const StepShape_DimensionalLocationWithPath *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_DimensionalLocationWithPath DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_DimensionalLocationWithPath {
    StepShape_DimensionalLocationWithPath* _get_reference() {
    return (StepShape_DimensionalLocationWithPath*)$self->Access();
    }
};

%extend Handle_StepShape_DimensionalLocationWithPath {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_DimensionalLocationWithPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_DimensionalSizeWithPath;
class StepShape_DimensionalSizeWithPath : public StepShape_DimensionalSize {
	public:
		%feature("compactdefaultargs") StepShape_DimensionalSizeWithPath;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_DimensionalSizeWithPath;
		 StepShape_DimensionalSizeWithPath ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDimensionalSize_AppliesTo:
	:type aDimensionalSize_AppliesTo: Handle_StepRepr_ShapeAspect &
	:param aDimensionalSize_Name:
	:type aDimensionalSize_Name: Handle_TCollection_HAsciiString &
	:param aPath:
	:type aPath: Handle_StepRepr_ShapeAspect &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_ShapeAspect & aDimensionalSize_AppliesTo,const Handle_TCollection_HAsciiString & aDimensionalSize_Name,const Handle_StepRepr_ShapeAspect & aPath);
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	* Returns field Path

	:rtype: Handle_StepRepr_ShapeAspect
") Path;
		Handle_StepRepr_ShapeAspect Path ();
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "	* Set field Path

	:param Path:
	:type Path: Handle_StepRepr_ShapeAspect &
	:rtype: None
") SetPath;
		void SetPath (const Handle_StepRepr_ShapeAspect & Path);
};


%extend StepShape_DimensionalSizeWithPath {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_DimensionalSizeWithPath(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_DimensionalSizeWithPath::Handle_StepShape_DimensionalSizeWithPath %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_DimensionalSizeWithPath;
class Handle_StepShape_DimensionalSizeWithPath : public Handle_StepShape_DimensionalSize {

    public:
        // constructors
        Handle_StepShape_DimensionalSizeWithPath();
        Handle_StepShape_DimensionalSizeWithPath(const Handle_StepShape_DimensionalSizeWithPath &aHandle);
        Handle_StepShape_DimensionalSizeWithPath(const StepShape_DimensionalSizeWithPath *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_DimensionalSizeWithPath DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_DimensionalSizeWithPath {
    StepShape_DimensionalSizeWithPath* _get_reference() {
    return (StepShape_DimensionalSizeWithPath*)$self->Access();
    }
};

%extend Handle_StepShape_DimensionalSizeWithPath {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_DimensionalSizeWithPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_DirectedDimensionalLocation;
class StepShape_DirectedDimensionalLocation : public StepShape_DimensionalLocation {
	public:
		%feature("compactdefaultargs") StepShape_DirectedDimensionalLocation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_DirectedDimensionalLocation;
		 StepShape_DirectedDimensionalLocation ();
};


%extend StepShape_DirectedDimensionalLocation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_DirectedDimensionalLocation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_DirectedDimensionalLocation::Handle_StepShape_DirectedDimensionalLocation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_DirectedDimensionalLocation;
class Handle_StepShape_DirectedDimensionalLocation : public Handle_StepShape_DimensionalLocation {

    public:
        // constructors
        Handle_StepShape_DirectedDimensionalLocation();
        Handle_StepShape_DirectedDimensionalLocation(const Handle_StepShape_DirectedDimensionalLocation &aHandle);
        Handle_StepShape_DirectedDimensionalLocation(const StepShape_DirectedDimensionalLocation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_DirectedDimensionalLocation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_DirectedDimensionalLocation {
    StepShape_DirectedDimensionalLocation* _get_reference() {
    return (StepShape_DirectedDimensionalLocation*)$self->Access();
    }
};

%extend Handle_StepShape_DirectedDimensionalLocation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_DirectedDimensionalLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Edge;
class StepShape_Edge : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_Edge;
		%feature("autodoc", "	* Returns a Edge

	:rtype: None
") StepShape_Edge;
		 StepShape_Edge ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aEdgeStart:
	:type aEdgeStart: Handle_StepShape_Vertex &
	:param aEdgeEnd:
	:type aEdgeEnd: Handle_StepShape_Vertex &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_Vertex & aEdgeStart,const Handle_StepShape_Vertex & aEdgeEnd);
		%feature("compactdefaultargs") SetEdgeStart;
		%feature("autodoc", "	:param aEdgeStart:
	:type aEdgeStart: Handle_StepShape_Vertex &
	:rtype: void
") SetEdgeStart;
		virtual void SetEdgeStart (const Handle_StepShape_Vertex & aEdgeStart);
		%feature("compactdefaultargs") EdgeStart;
		%feature("autodoc", "	:rtype: Handle_StepShape_Vertex
") EdgeStart;
		virtual Handle_StepShape_Vertex EdgeStart ();
		%feature("compactdefaultargs") SetEdgeEnd;
		%feature("autodoc", "	:param aEdgeEnd:
	:type aEdgeEnd: Handle_StepShape_Vertex &
	:rtype: void
") SetEdgeEnd;
		virtual void SetEdgeEnd (const Handle_StepShape_Vertex & aEdgeEnd);
		%feature("compactdefaultargs") EdgeEnd;
		%feature("autodoc", "	:rtype: Handle_StepShape_Vertex
") EdgeEnd;
		virtual Handle_StepShape_Vertex EdgeEnd ();
};


%extend StepShape_Edge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Edge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Edge::Handle_StepShape_Edge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Edge;
class Handle_StepShape_Edge : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_Edge();
        Handle_StepShape_Edge(const Handle_StepShape_Edge &aHandle);
        Handle_StepShape_Edge(const StepShape_Edge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Edge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Edge {
    StepShape_Edge* _get_reference() {
    return (StepShape_Edge*)$self->Access();
    }
};

%extend Handle_StepShape_Edge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_EdgeBasedWireframeShapeRepresentation;
class StepShape_EdgeBasedWireframeShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_EdgeBasedWireframeShapeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_EdgeBasedWireframeShapeRepresentation;
		 StepShape_EdgeBasedWireframeShapeRepresentation ();
};


%extend StepShape_EdgeBasedWireframeShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_EdgeBasedWireframeShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_EdgeBasedWireframeShapeRepresentation::Handle_StepShape_EdgeBasedWireframeShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_EdgeBasedWireframeShapeRepresentation;
class Handle_StepShape_EdgeBasedWireframeShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_EdgeBasedWireframeShapeRepresentation();
        Handle_StepShape_EdgeBasedWireframeShapeRepresentation(const Handle_StepShape_EdgeBasedWireframeShapeRepresentation &aHandle);
        Handle_StepShape_EdgeBasedWireframeShapeRepresentation(const StepShape_EdgeBasedWireframeShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_EdgeBasedWireframeShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_EdgeBasedWireframeShapeRepresentation {
    StepShape_EdgeBasedWireframeShapeRepresentation* _get_reference() {
    return (StepShape_EdgeBasedWireframeShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_EdgeBasedWireframeShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_EdgeBasedWireframeShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Face;
class StepShape_Face : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_Face;
		%feature("autodoc", "	* Returns a Face

	:rtype: None
") StepShape_Face;
		 StepShape_Face ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBounds:
	:type aBounds: Handle_StepShape_HArray1OfFaceBound &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfFaceBound & aBounds);
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "	:param aBounds:
	:type aBounds: Handle_StepShape_HArray1OfFaceBound &
	:rtype: void
") SetBounds;
		virtual void SetBounds (const Handle_StepShape_HArray1OfFaceBound & aBounds);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfFaceBound
") Bounds;
		virtual Handle_StepShape_HArray1OfFaceBound Bounds ();
		%feature("compactdefaultargs") BoundsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_FaceBound
") BoundsValue;
		virtual Handle_StepShape_FaceBound BoundsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbBounds;
		%feature("autodoc", "	:rtype: int
") NbBounds;
		virtual Standard_Integer NbBounds ();
};


%extend StepShape_Face {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Face(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Face::Handle_StepShape_Face %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Face;
class Handle_StepShape_Face : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_Face();
        Handle_StepShape_Face(const Handle_StepShape_Face &aHandle);
        Handle_StepShape_Face(const StepShape_Face *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Face DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Face {
    StepShape_Face* _get_reference() {
    return (StepShape_Face*)$self->Access();
    }
};

%extend Handle_StepShape_Face {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_FaceBound;
class StepShape_FaceBound : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_FaceBound;
		%feature("autodoc", "	* Returns a FaceBound

	:rtype: None
") StepShape_FaceBound;
		 StepShape_FaceBound ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBound:
	:type aBound: Handle_StepShape_Loop &
	:param aOrientation:
	:type aOrientation: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_Loop & aBound,const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") SetBound;
		%feature("autodoc", "	:param aBound:
	:type aBound: Handle_StepShape_Loop &
	:rtype: None
") SetBound;
		void SetBound (const Handle_StepShape_Loop & aBound);
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "	:rtype: Handle_StepShape_Loop
") Bound;
		Handle_StepShape_Loop Bound ();
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: bool
") Orientation;
		Standard_Boolean Orientation ();
};


%extend StepShape_FaceBound {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_FaceBound(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_FaceBound::Handle_StepShape_FaceBound %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_FaceBound;
class Handle_StepShape_FaceBound : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_FaceBound();
        Handle_StepShape_FaceBound(const Handle_StepShape_FaceBound &aHandle);
        Handle_StepShape_FaceBound(const StepShape_FaceBound *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_FaceBound DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_FaceBound {
    StepShape_FaceBound* _get_reference() {
    return (StepShape_FaceBound*)$self->Access();
    }
};

%extend Handle_StepShape_FaceBound {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_FaceBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_FacetedBrepShapeRepresentation;
class StepShape_FacetedBrepShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_FacetedBrepShapeRepresentation;
		%feature("autodoc", "	* Returns a FacetedBrepShapeRepresentation

	:rtype: None
") StepShape_FacetedBrepShapeRepresentation;
		 StepShape_FacetedBrepShapeRepresentation ();
};


%extend StepShape_FacetedBrepShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_FacetedBrepShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_FacetedBrepShapeRepresentation::Handle_StepShape_FacetedBrepShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_FacetedBrepShapeRepresentation;
class Handle_StepShape_FacetedBrepShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_FacetedBrepShapeRepresentation();
        Handle_StepShape_FacetedBrepShapeRepresentation(const Handle_StepShape_FacetedBrepShapeRepresentation &aHandle);
        Handle_StepShape_FacetedBrepShapeRepresentation(const StepShape_FacetedBrepShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_FacetedBrepShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_FacetedBrepShapeRepresentation {
    StepShape_FacetedBrepShapeRepresentation* _get_reference() {
    return (StepShape_FacetedBrepShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_FacetedBrepShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_FacetedBrepShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_GeometricCurveSet;
class StepShape_GeometricCurveSet : public StepShape_GeometricSet {
	public:
		%feature("compactdefaultargs") StepShape_GeometricCurveSet;
		%feature("autodoc", "	* Returns a GeometricCurveSet

	:rtype: None
") StepShape_GeometricCurveSet;
		 StepShape_GeometricCurveSet ();
};


%extend StepShape_GeometricCurveSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_GeometricCurveSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_GeometricCurveSet::Handle_StepShape_GeometricCurveSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_GeometricCurveSet;
class Handle_StepShape_GeometricCurveSet : public Handle_StepShape_GeometricSet {

    public:
        // constructors
        Handle_StepShape_GeometricCurveSet();
        Handle_StepShape_GeometricCurveSet(const Handle_StepShape_GeometricCurveSet &aHandle);
        Handle_StepShape_GeometricCurveSet(const StepShape_GeometricCurveSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_GeometricCurveSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_GeometricCurveSet {
    StepShape_GeometricCurveSet* _get_reference() {
    return (StepShape_GeometricCurveSet*)$self->Access();
    }
};

%extend Handle_StepShape_GeometricCurveSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_GeometricCurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_GeometricallyBoundedSurfaceShapeRepresentation;
class StepShape_GeometricallyBoundedSurfaceShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_GeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "	* Returns a GeometricallyBoundedSurfaceShapeRepresentation

	:rtype: None
") StepShape_GeometricallyBoundedSurfaceShapeRepresentation;
		 StepShape_GeometricallyBoundedSurfaceShapeRepresentation ();
};


%extend StepShape_GeometricallyBoundedSurfaceShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation::Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation;
class Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation();
        Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation(const Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation &aHandle);
        Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation(const StepShape_GeometricallyBoundedSurfaceShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation {
    StepShape_GeometricallyBoundedSurfaceShapeRepresentation* _get_reference() {
    return (StepShape_GeometricallyBoundedSurfaceShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_GeometricallyBoundedSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_GeometricallyBoundedWireframeShapeRepresentation;
class StepShape_GeometricallyBoundedWireframeShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_GeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "	* Returns a GeometricallyBoundedWireframeShapeRepresentation

	:rtype: None
") StepShape_GeometricallyBoundedWireframeShapeRepresentation;
		 StepShape_GeometricallyBoundedWireframeShapeRepresentation ();
};


%extend StepShape_GeometricallyBoundedWireframeShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation::Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation;
class Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation();
        Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation(const Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation &aHandle);
        Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation(const StepShape_GeometricallyBoundedWireframeShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation {
    StepShape_GeometricallyBoundedWireframeShapeRepresentation* _get_reference() {
    return (StepShape_GeometricallyBoundedWireframeShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_GeometricallyBoundedWireframeShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Loop;
class StepShape_Loop : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_Loop;
		%feature("autodoc", "	* Returns a Loop

	:rtype: None
") StepShape_Loop;
		 StepShape_Loop ();
};


%extend StepShape_Loop {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Loop(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Loop::Handle_StepShape_Loop %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Loop;
class Handle_StepShape_Loop : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_Loop();
        Handle_StepShape_Loop(const Handle_StepShape_Loop &aHandle);
        Handle_StepShape_Loop(const StepShape_Loop *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Loop DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Loop {
    StepShape_Loop* _get_reference() {
    return (StepShape_Loop*)$self->Access();
    }
};

%extend Handle_StepShape_Loop {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Loop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_LoopAndPath;
class StepShape_LoopAndPath : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_LoopAndPath;
		%feature("autodoc", "	* Returns a LoopAndPath

	:rtype: None
") StepShape_LoopAndPath;
		 StepShape_LoopAndPath ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLoop:
	:type aLoop: Handle_StepShape_Loop &
	:param aPath:
	:type aPath: Handle_StepShape_Path &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_Loop & aLoop,const Handle_StepShape_Path & aPath);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aEdgeList:
	:type aEdgeList: Handle_StepShape_HArray1OfOrientedEdge &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfOrientedEdge & aEdgeList);
		%feature("compactdefaultargs") SetLoop;
		%feature("autodoc", "	:param aLoop:
	:type aLoop: Handle_StepShape_Loop &
	:rtype: None
") SetLoop;
		void SetLoop (const Handle_StepShape_Loop & aLoop);
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "	:rtype: Handle_StepShape_Loop
") Loop;
		Handle_StepShape_Loop Loop ();
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "	:param aPath:
	:type aPath: Handle_StepShape_Path &
	:rtype: None
") SetPath;
		void SetPath (const Handle_StepShape_Path & aPath);
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	:rtype: Handle_StepShape_Path
") Path;
		Handle_StepShape_Path Path ();
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", "	:param aEdgeList:
	:type aEdgeList: Handle_StepShape_HArray1OfOrientedEdge &
	:rtype: None
") SetEdgeList;
		void SetEdgeList (const Handle_StepShape_HArray1OfOrientedEdge & aEdgeList);
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfOrientedEdge
") EdgeList;
		Handle_StepShape_HArray1OfOrientedEdge EdgeList ();
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_OrientedEdge
") EdgeListValue;
		Handle_StepShape_OrientedEdge EdgeListValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "	:rtype: int
") NbEdgeList;
		Standard_Integer NbEdgeList ();
};


%extend StepShape_LoopAndPath {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_LoopAndPath(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_LoopAndPath::Handle_StepShape_LoopAndPath %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_LoopAndPath;
class Handle_StepShape_LoopAndPath : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_LoopAndPath();
        Handle_StepShape_LoopAndPath(const Handle_StepShape_LoopAndPath &aHandle);
        Handle_StepShape_LoopAndPath(const StepShape_LoopAndPath *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_LoopAndPath DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_LoopAndPath {
    StepShape_LoopAndPath* _get_reference() {
    return (StepShape_LoopAndPath*)$self->Access();
    }
};

%extend Handle_StepShape_LoopAndPath {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_LoopAndPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ManifoldSolidBrep;
class StepShape_ManifoldSolidBrep : public StepShape_SolidModel {
	public:
		%feature("compactdefaultargs") StepShape_ManifoldSolidBrep;
		%feature("autodoc", "	* Returns a ManifoldSolidBrep

	:rtype: None
") StepShape_ManifoldSolidBrep;
		 StepShape_ManifoldSolidBrep ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOuter:
	:type aOuter: Handle_StepShape_ClosedShell &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_ClosedShell & aOuter);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOuter:
	:type aOuter: Handle_StepShape_ConnectedFaceSet &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_ConnectedFaceSet & aOuter);
		%feature("compactdefaultargs") SetOuter;
		%feature("autodoc", "	:param aOuter:
	:type aOuter: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") SetOuter;
		void SetOuter (const Handle_StepShape_ConnectedFaceSet & aOuter);
		%feature("compactdefaultargs") Outer;
		%feature("autodoc", "	:rtype: Handle_StepShape_ConnectedFaceSet
") Outer;
		Handle_StepShape_ConnectedFaceSet Outer ();
};


%extend StepShape_ManifoldSolidBrep {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ManifoldSolidBrep(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ManifoldSolidBrep::Handle_StepShape_ManifoldSolidBrep %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ManifoldSolidBrep;
class Handle_StepShape_ManifoldSolidBrep : public Handle_StepShape_SolidModel {

    public:
        // constructors
        Handle_StepShape_ManifoldSolidBrep();
        Handle_StepShape_ManifoldSolidBrep(const Handle_StepShape_ManifoldSolidBrep &aHandle);
        Handle_StepShape_ManifoldSolidBrep(const StepShape_ManifoldSolidBrep *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ManifoldSolidBrep DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ManifoldSolidBrep {
    StepShape_ManifoldSolidBrep* _get_reference() {
    return (StepShape_ManifoldSolidBrep*)$self->Access();
    }
};

%extend Handle_StepShape_ManifoldSolidBrep {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ManifoldSolidBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ManifoldSurfaceShapeRepresentation;
class StepShape_ManifoldSurfaceShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_ManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "	* Returns a ManifoldSurfaceShapeRepresentation

	:rtype: None
") StepShape_ManifoldSurfaceShapeRepresentation;
		 StepShape_ManifoldSurfaceShapeRepresentation ();
};


%extend StepShape_ManifoldSurfaceShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ManifoldSurfaceShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ManifoldSurfaceShapeRepresentation::Handle_StepShape_ManifoldSurfaceShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ManifoldSurfaceShapeRepresentation;
class Handle_StepShape_ManifoldSurfaceShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_ManifoldSurfaceShapeRepresentation();
        Handle_StepShape_ManifoldSurfaceShapeRepresentation(const Handle_StepShape_ManifoldSurfaceShapeRepresentation &aHandle);
        Handle_StepShape_ManifoldSurfaceShapeRepresentation(const StepShape_ManifoldSurfaceShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ManifoldSurfaceShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ManifoldSurfaceShapeRepresentation {
    StepShape_ManifoldSurfaceShapeRepresentation* _get_reference() {
    return (StepShape_ManifoldSurfaceShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_ManifoldSurfaceShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ManifoldSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_NonManifoldSurfaceShapeRepresentation;
class StepShape_NonManifoldSurfaceShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_NonManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_NonManifoldSurfaceShapeRepresentation;
		 StepShape_NonManifoldSurfaceShapeRepresentation ();
};


%extend StepShape_NonManifoldSurfaceShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_NonManifoldSurfaceShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_NonManifoldSurfaceShapeRepresentation::Handle_StepShape_NonManifoldSurfaceShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_NonManifoldSurfaceShapeRepresentation;
class Handle_StepShape_NonManifoldSurfaceShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_NonManifoldSurfaceShapeRepresentation();
        Handle_StepShape_NonManifoldSurfaceShapeRepresentation(const Handle_StepShape_NonManifoldSurfaceShapeRepresentation &aHandle);
        Handle_StepShape_NonManifoldSurfaceShapeRepresentation(const StepShape_NonManifoldSurfaceShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_NonManifoldSurfaceShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_NonManifoldSurfaceShapeRepresentation {
    StepShape_NonManifoldSurfaceShapeRepresentation* _get_reference() {
    return (StepShape_NonManifoldSurfaceShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_NonManifoldSurfaceShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_NonManifoldSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Path;
class StepShape_Path : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_Path;
		%feature("autodoc", "	* Returns a Path

	:rtype: None
") StepShape_Path;
		 StepShape_Path ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aEdgeList:
	:type aEdgeList: Handle_StepShape_HArray1OfOrientedEdge &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfOrientedEdge & aEdgeList);
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", "	:param aEdgeList:
	:type aEdgeList: Handle_StepShape_HArray1OfOrientedEdge &
	:rtype: void
") SetEdgeList;
		virtual void SetEdgeList (const Handle_StepShape_HArray1OfOrientedEdge & aEdgeList);
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfOrientedEdge
") EdgeList;
		virtual Handle_StepShape_HArray1OfOrientedEdge EdgeList ();
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_OrientedEdge
") EdgeListValue;
		virtual Handle_StepShape_OrientedEdge EdgeListValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "	:rtype: int
") NbEdgeList;
		virtual Standard_Integer NbEdgeList ();
};


%extend StepShape_Path {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Path(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Path::Handle_StepShape_Path %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Path;
class Handle_StepShape_Path : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_Path();
        Handle_StepShape_Path(const Handle_StepShape_Path &aHandle);
        Handle_StepShape_Path(const StepShape_Path *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Path DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Path {
    StepShape_Path* _get_reference() {
    return (StepShape_Path*)$self->Access();
    }
};

%extend Handle_StepShape_Path {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Path {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_PointRepresentation;
class StepShape_PointRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_PointRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_PointRepresentation;
		 StepShape_PointRepresentation ();
};


%extend StepShape_PointRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_PointRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_PointRepresentation::Handle_StepShape_PointRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_PointRepresentation;
class Handle_StepShape_PointRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_PointRepresentation();
        Handle_StepShape_PointRepresentation(const Handle_StepShape_PointRepresentation &aHandle);
        Handle_StepShape_PointRepresentation(const StepShape_PointRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_PointRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_PointRepresentation {
    StepShape_PointRepresentation* _get_reference() {
    return (StepShape_PointRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_PointRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_PointRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ShapeDimensionRepresentation;
class StepShape_ShapeDimensionRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_ShapeDimensionRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_ShapeDimensionRepresentation;
		 StepShape_ShapeDimensionRepresentation ();
};


%extend StepShape_ShapeDimensionRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ShapeDimensionRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ShapeDimensionRepresentation::Handle_StepShape_ShapeDimensionRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ShapeDimensionRepresentation;
class Handle_StepShape_ShapeDimensionRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_ShapeDimensionRepresentation();
        Handle_StepShape_ShapeDimensionRepresentation(const Handle_StepShape_ShapeDimensionRepresentation &aHandle);
        Handle_StepShape_ShapeDimensionRepresentation(const StepShape_ShapeDimensionRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ShapeDimensionRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ShapeDimensionRepresentation {
    StepShape_ShapeDimensionRepresentation* _get_reference() {
    return (StepShape_ShapeDimensionRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_ShapeDimensionRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ShapeDimensionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ShapeRepresentationWithParameters;
class StepShape_ShapeRepresentationWithParameters : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_ShapeRepresentationWithParameters;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_ShapeRepresentationWithParameters;
		 StepShape_ShapeRepresentationWithParameters ();
};


%extend StepShape_ShapeRepresentationWithParameters {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ShapeRepresentationWithParameters(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ShapeRepresentationWithParameters::Handle_StepShape_ShapeRepresentationWithParameters %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ShapeRepresentationWithParameters;
class Handle_StepShape_ShapeRepresentationWithParameters : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_ShapeRepresentationWithParameters();
        Handle_StepShape_ShapeRepresentationWithParameters(const Handle_StepShape_ShapeRepresentationWithParameters &aHandle);
        Handle_StepShape_ShapeRepresentationWithParameters(const StepShape_ShapeRepresentationWithParameters *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ShapeRepresentationWithParameters DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ShapeRepresentationWithParameters {
    StepShape_ShapeRepresentationWithParameters* _get_reference() {
    return (StepShape_ShapeRepresentationWithParameters*)$self->Access();
    }
};

%extend Handle_StepShape_ShapeRepresentationWithParameters {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ShapeRepresentationWithParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_SolidReplica;
class StepShape_SolidReplica : public StepShape_SolidModel {
	public:
		%feature("compactdefaultargs") StepShape_SolidReplica;
		%feature("autodoc", "	* Returns a SolidReplica

	:rtype: None
") StepShape_SolidReplica;
		 StepShape_SolidReplica ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aParentSolid:
	:type aParentSolid: Handle_StepShape_SolidModel &
	:param aTransformation:
	:type aTransformation: Handle_StepGeom_CartesianTransformationOperator3d &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_SolidModel & aParentSolid,const Handle_StepGeom_CartesianTransformationOperator3d & aTransformation);
		%feature("compactdefaultargs") SetParentSolid;
		%feature("autodoc", "	:param aParentSolid:
	:type aParentSolid: Handle_StepShape_SolidModel &
	:rtype: None
") SetParentSolid;
		void SetParentSolid (const Handle_StepShape_SolidModel & aParentSolid);
		%feature("compactdefaultargs") ParentSolid;
		%feature("autodoc", "	:rtype: Handle_StepShape_SolidModel
") ParentSolid;
		Handle_StepShape_SolidModel ParentSolid ();
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	:param aTransformation:
	:type aTransformation: Handle_StepGeom_CartesianTransformationOperator3d &
	:rtype: None
") SetTransformation;
		void SetTransformation (const Handle_StepGeom_CartesianTransformationOperator3d & aTransformation);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianTransformationOperator3d
") Transformation;
		Handle_StepGeom_CartesianTransformationOperator3d Transformation ();
};


%extend StepShape_SolidReplica {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_SolidReplica(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_SolidReplica::Handle_StepShape_SolidReplica %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_SolidReplica;
class Handle_StepShape_SolidReplica : public Handle_StepShape_SolidModel {

    public:
        // constructors
        Handle_StepShape_SolidReplica();
        Handle_StepShape_SolidReplica(const Handle_StepShape_SolidReplica &aHandle);
        Handle_StepShape_SolidReplica(const StepShape_SolidReplica *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_SolidReplica DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_SolidReplica {
    StepShape_SolidReplica* _get_reference() {
    return (StepShape_SolidReplica*)$self->Access();
    }
};

%extend Handle_StepShape_SolidReplica {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_SolidReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_SweptAreaSolid;
class StepShape_SweptAreaSolid : public StepShape_SolidModel {
	public:
		%feature("compactdefaultargs") StepShape_SweptAreaSolid;
		%feature("autodoc", "	* Returns a SweptAreaSolid

	:rtype: None
") StepShape_SweptAreaSolid;
		 StepShape_SweptAreaSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepGeom_CurveBoundedSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CurveBoundedSurface & aSweptArea);
		%feature("compactdefaultargs") SetSweptArea;
		%feature("autodoc", "	:param aSweptArea:
	:type aSweptArea: Handle_StepGeom_CurveBoundedSurface &
	:rtype: None
") SetSweptArea;
		void SetSweptArea (const Handle_StepGeom_CurveBoundedSurface & aSweptArea);
		%feature("compactdefaultargs") SweptArea;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CurveBoundedSurface
") SweptArea;
		Handle_StepGeom_CurveBoundedSurface SweptArea ();
};


%extend StepShape_SweptAreaSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_SweptAreaSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_SweptAreaSolid::Handle_StepShape_SweptAreaSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_SweptAreaSolid;
class Handle_StepShape_SweptAreaSolid : public Handle_StepShape_SolidModel {

    public:
        // constructors
        Handle_StepShape_SweptAreaSolid();
        Handle_StepShape_SweptAreaSolid(const Handle_StepShape_SweptAreaSolid &aHandle);
        Handle_StepShape_SweptAreaSolid(const StepShape_SweptAreaSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_SweptAreaSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_SweptAreaSolid {
    StepShape_SweptAreaSolid* _get_reference() {
    return (StepShape_SweptAreaSolid*)$self->Access();
    }
};

%extend Handle_StepShape_SweptAreaSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_SweptAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_SweptFaceSolid;
class StepShape_SweptFaceSolid : public StepShape_SolidModel {
	public:
		%feature("compactdefaultargs") StepShape_SweptFaceSolid;
		%feature("autodoc", "	* Returns a SweptFaceSolid

	:rtype: None
") StepShape_SweptFaceSolid;
		 StepShape_SweptFaceSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepShape_FaceSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_FaceSurface & aSweptArea);
		%feature("compactdefaultargs") SetSweptFace;
		%feature("autodoc", "	:param aSweptArea:
	:type aSweptArea: Handle_StepShape_FaceSurface &
	:rtype: void
") SetSweptFace;
		virtual void SetSweptFace (const Handle_StepShape_FaceSurface & aSweptArea);
		%feature("compactdefaultargs") SweptFace;
		%feature("autodoc", "	:rtype: Handle_StepShape_FaceSurface
") SweptFace;
		virtual Handle_StepShape_FaceSurface SweptFace ();
};


%extend StepShape_SweptFaceSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_SweptFaceSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_SweptFaceSolid::Handle_StepShape_SweptFaceSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_SweptFaceSolid;
class Handle_StepShape_SweptFaceSolid : public Handle_StepShape_SolidModel {

    public:
        // constructors
        Handle_StepShape_SweptFaceSolid();
        Handle_StepShape_SweptFaceSolid(const Handle_StepShape_SweptFaceSolid &aHandle);
        Handle_StepShape_SweptFaceSolid(const StepShape_SweptFaceSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_SweptFaceSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_SweptFaceSolid {
    StepShape_SweptFaceSolid* _get_reference() {
    return (StepShape_SweptFaceSolid*)$self->Access();
    }
};

%extend Handle_StepShape_SweptFaceSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_SweptFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_TransitionalShapeRepresentation;
class StepShape_TransitionalShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		%feature("compactdefaultargs") StepShape_TransitionalShapeRepresentation;
		%feature("autodoc", "	* Returns a TransitionalShapeRepresentation

	:rtype: None
") StepShape_TransitionalShapeRepresentation;
		 StepShape_TransitionalShapeRepresentation ();
};


%extend StepShape_TransitionalShapeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_TransitionalShapeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_TransitionalShapeRepresentation::Handle_StepShape_TransitionalShapeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_TransitionalShapeRepresentation;
class Handle_StepShape_TransitionalShapeRepresentation : public Handle_StepShape_ShapeRepresentation {

    public:
        // constructors
        Handle_StepShape_TransitionalShapeRepresentation();
        Handle_StepShape_TransitionalShapeRepresentation(const Handle_StepShape_TransitionalShapeRepresentation &aHandle);
        Handle_StepShape_TransitionalShapeRepresentation(const StepShape_TransitionalShapeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_TransitionalShapeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_TransitionalShapeRepresentation {
    StepShape_TransitionalShapeRepresentation* _get_reference() {
    return (StepShape_TransitionalShapeRepresentation*)$self->Access();
    }
};

%extend Handle_StepShape_TransitionalShapeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_TransitionalShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Vertex;
class StepShape_Vertex : public StepShape_TopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") StepShape_Vertex;
		%feature("autodoc", "	* Returns a Vertex

	:rtype: None
") StepShape_Vertex;
		 StepShape_Vertex ();
};


%extend StepShape_Vertex {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Vertex(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Vertex::Handle_StepShape_Vertex %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Vertex;
class Handle_StepShape_Vertex : public Handle_StepShape_TopologicalRepresentationItem {

    public:
        // constructors
        Handle_StepShape_Vertex();
        Handle_StepShape_Vertex(const Handle_StepShape_Vertex &aHandle);
        Handle_StepShape_Vertex(const StepShape_Vertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Vertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Vertex {
    StepShape_Vertex* _get_reference() {
    return (StepShape_Vertex*)$self->Access();
    }
};

%extend Handle_StepShape_Vertex {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_BrepWithVoids;
class StepShape_BrepWithVoids : public StepShape_ManifoldSolidBrep {
	public:
		%feature("compactdefaultargs") StepShape_BrepWithVoids;
		%feature("autodoc", "	* Returns a BrepWithVoids

	:rtype: None
") StepShape_BrepWithVoids;
		 StepShape_BrepWithVoids ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOuter:
	:type aOuter: Handle_StepShape_ClosedShell &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_ClosedShell & aOuter);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOuter:
	:type aOuter: Handle_StepShape_ClosedShell &
	:param aVoids:
	:type aVoids: Handle_StepShape_HArray1OfOrientedClosedShell &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_ClosedShell & aOuter,const Handle_StepShape_HArray1OfOrientedClosedShell & aVoids);
		%feature("compactdefaultargs") SetVoids;
		%feature("autodoc", "	:param aVoids:
	:type aVoids: Handle_StepShape_HArray1OfOrientedClosedShell &
	:rtype: None
") SetVoids;
		void SetVoids (const Handle_StepShape_HArray1OfOrientedClosedShell & aVoids);
		%feature("compactdefaultargs") Voids;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfOrientedClosedShell
") Voids;
		Handle_StepShape_HArray1OfOrientedClosedShell Voids ();
		%feature("compactdefaultargs") VoidsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_OrientedClosedShell
") VoidsValue;
		Handle_StepShape_OrientedClosedShell VoidsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbVoids;
		%feature("autodoc", "	:rtype: int
") NbVoids;
		Standard_Integer NbVoids ();
};


%extend StepShape_BrepWithVoids {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_BrepWithVoids(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_BrepWithVoids::Handle_StepShape_BrepWithVoids %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_BrepWithVoids;
class Handle_StepShape_BrepWithVoids : public Handle_StepShape_ManifoldSolidBrep {

    public:
        // constructors
        Handle_StepShape_BrepWithVoids();
        Handle_StepShape_BrepWithVoids(const Handle_StepShape_BrepWithVoids &aHandle);
        Handle_StepShape_BrepWithVoids(const StepShape_BrepWithVoids *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_BrepWithVoids DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_BrepWithVoids {
    StepShape_BrepWithVoids* _get_reference() {
    return (StepShape_BrepWithVoids*)$self->Access();
    }
};

%extend Handle_StepShape_BrepWithVoids {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_BrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ClosedShell;
class StepShape_ClosedShell : public StepShape_ConnectedFaceSet {
	public:
		%feature("compactdefaultargs") StepShape_ClosedShell;
		%feature("autodoc", "	* Returns a ClosedShell

	:rtype: None
") StepShape_ClosedShell;
		 StepShape_ClosedShell ();
};


%extend StepShape_ClosedShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ClosedShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ClosedShell::Handle_StepShape_ClosedShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ClosedShell;
class Handle_StepShape_ClosedShell : public Handle_StepShape_ConnectedFaceSet {

    public:
        // constructors
        Handle_StepShape_ClosedShell();
        Handle_StepShape_ClosedShell(const Handle_StepShape_ClosedShell &aHandle);
        Handle_StepShape_ClosedShell(const StepShape_ClosedShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ClosedShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ClosedShell {
    StepShape_ClosedShell* _get_reference() {
    return (StepShape_ClosedShell*)$self->Access();
    }
};

%extend Handle_StepShape_ClosedShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ConnectedFaceSubSet;
class StepShape_ConnectedFaceSubSet : public StepShape_ConnectedFaceSet {
	public:
		%feature("compactdefaultargs") StepShape_ConnectedFaceSubSet;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_ConnectedFaceSubSet;
		 StepShape_ConnectedFaceSubSet ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aConnectedFaceSet_CfsFaces:
	:type aConnectedFaceSet_CfsFaces: Handle_StepShape_HArray1OfFace &
	:param aParentFaceSet:
	:type aParentFaceSet: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepShape_HArray1OfFace & aConnectedFaceSet_CfsFaces,const Handle_StepShape_ConnectedFaceSet & aParentFaceSet);
		%feature("compactdefaultargs") ParentFaceSet;
		%feature("autodoc", "	* Returns field ParentFaceSet

	:rtype: Handle_StepShape_ConnectedFaceSet
") ParentFaceSet;
		Handle_StepShape_ConnectedFaceSet ParentFaceSet ();
		%feature("compactdefaultargs") SetParentFaceSet;
		%feature("autodoc", "	* Set field ParentFaceSet

	:param ParentFaceSet:
	:type ParentFaceSet: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") SetParentFaceSet;
		void SetParentFaceSet (const Handle_StepShape_ConnectedFaceSet & ParentFaceSet);
};


%extend StepShape_ConnectedFaceSubSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ConnectedFaceSubSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ConnectedFaceSubSet::Handle_StepShape_ConnectedFaceSubSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ConnectedFaceSubSet;
class Handle_StepShape_ConnectedFaceSubSet : public Handle_StepShape_ConnectedFaceSet {

    public:
        // constructors
        Handle_StepShape_ConnectedFaceSubSet();
        Handle_StepShape_ConnectedFaceSubSet(const Handle_StepShape_ConnectedFaceSubSet &aHandle);
        Handle_StepShape_ConnectedFaceSubSet(const StepShape_ConnectedFaceSubSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ConnectedFaceSubSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ConnectedFaceSubSet {
    StepShape_ConnectedFaceSubSet* _get_reference() {
    return (StepShape_ConnectedFaceSubSet*)$self->Access();
    }
};

%extend Handle_StepShape_ConnectedFaceSubSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ConnectedFaceSubSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_EdgeCurve;
class StepShape_EdgeCurve : public StepShape_Edge {
	public:
		%feature("compactdefaultargs") StepShape_EdgeCurve;
		%feature("autodoc", "	* Returns a EdgeCurve

	:rtype: None
") StepShape_EdgeCurve;
		 StepShape_EdgeCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aEdgeStart:
	:type aEdgeStart: Handle_StepShape_Vertex &
	:param aEdgeEnd:
	:type aEdgeEnd: Handle_StepShape_Vertex &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_Vertex & aEdgeStart,const Handle_StepShape_Vertex & aEdgeEnd);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aEdgeStart:
	:type aEdgeStart: Handle_StepShape_Vertex &
	:param aEdgeEnd:
	:type aEdgeEnd: Handle_StepShape_Vertex &
	:param aEdgeGeometry:
	:type aEdgeGeometry: Handle_StepGeom_Curve &
	:param aSameSense:
	:type aSameSense: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_Vertex & aEdgeStart,const Handle_StepShape_Vertex & aEdgeEnd,const Handle_StepGeom_Curve & aEdgeGeometry,const Standard_Boolean aSameSense);
		%feature("compactdefaultargs") SetEdgeGeometry;
		%feature("autodoc", "	:param aEdgeGeometry:
	:type aEdgeGeometry: Handle_StepGeom_Curve &
	:rtype: None
") SetEdgeGeometry;
		void SetEdgeGeometry (const Handle_StepGeom_Curve & aEdgeGeometry);
		%feature("compactdefaultargs") EdgeGeometry;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") EdgeGeometry;
		Handle_StepGeom_Curve EdgeGeometry ();
		%feature("compactdefaultargs") SetSameSense;
		%feature("autodoc", "	:param aSameSense:
	:type aSameSense: bool
	:rtype: None
") SetSameSense;
		void SetSameSense (const Standard_Boolean aSameSense);
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", "	:rtype: bool
") SameSense;
		Standard_Boolean SameSense ();
};


%extend StepShape_EdgeCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_EdgeCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_EdgeCurve::Handle_StepShape_EdgeCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_EdgeCurve;
class Handle_StepShape_EdgeCurve : public Handle_StepShape_Edge {

    public:
        // constructors
        Handle_StepShape_EdgeCurve();
        Handle_StepShape_EdgeCurve(const Handle_StepShape_EdgeCurve &aHandle);
        Handle_StepShape_EdgeCurve(const StepShape_EdgeCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_EdgeCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_EdgeCurve {
    StepShape_EdgeCurve* _get_reference() {
    return (StepShape_EdgeCurve*)$self->Access();
    }
};

%extend Handle_StepShape_EdgeCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_EdgeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_EdgeLoop;
class StepShape_EdgeLoop : public StepShape_Loop {
	public:
		%feature("compactdefaultargs") StepShape_EdgeLoop;
		%feature("autodoc", "	* Returns a EdgeLoop

	:rtype: None
") StepShape_EdgeLoop;
		 StepShape_EdgeLoop ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aEdgeList:
	:type aEdgeList: Handle_StepShape_HArray1OfOrientedEdge &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfOrientedEdge & aEdgeList);
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", "	:param aEdgeList:
	:type aEdgeList: Handle_StepShape_HArray1OfOrientedEdge &
	:rtype: None
") SetEdgeList;
		void SetEdgeList (const Handle_StepShape_HArray1OfOrientedEdge & aEdgeList);
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfOrientedEdge
") EdgeList;
		Handle_StepShape_HArray1OfOrientedEdge EdgeList ();
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_OrientedEdge
") EdgeListValue;
		Handle_StepShape_OrientedEdge EdgeListValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "	:rtype: int
") NbEdgeList;
		Standard_Integer NbEdgeList ();
};


%extend StepShape_EdgeLoop {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_EdgeLoop(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_EdgeLoop::Handle_StepShape_EdgeLoop %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_EdgeLoop;
class Handle_StepShape_EdgeLoop : public Handle_StepShape_Loop {

    public:
        // constructors
        Handle_StepShape_EdgeLoop();
        Handle_StepShape_EdgeLoop(const Handle_StepShape_EdgeLoop &aHandle);
        Handle_StepShape_EdgeLoop(const StepShape_EdgeLoop *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_EdgeLoop DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_EdgeLoop {
    StepShape_EdgeLoop* _get_reference() {
    return (StepShape_EdgeLoop*)$self->Access();
    }
};

%extend Handle_StepShape_EdgeLoop {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_EdgeLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ExtrudedAreaSolid;
class StepShape_ExtrudedAreaSolid : public StepShape_SweptAreaSolid {
	public:
		%feature("compactdefaultargs") StepShape_ExtrudedAreaSolid;
		%feature("autodoc", "	* Returns a ExtrudedAreaSolid

	:rtype: None
") StepShape_ExtrudedAreaSolid;
		 StepShape_ExtrudedAreaSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepGeom_CurveBoundedSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CurveBoundedSurface & aSweptArea);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepGeom_CurveBoundedSurface &
	:param aExtrudedDirection:
	:type aExtrudedDirection: Handle_StepGeom_Direction &
	:param aDepth:
	:type aDepth: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CurveBoundedSurface & aSweptArea,const Handle_StepGeom_Direction & aExtrudedDirection,const Standard_Real aDepth);
		%feature("compactdefaultargs") SetExtrudedDirection;
		%feature("autodoc", "	:param aExtrudedDirection:
	:type aExtrudedDirection: Handle_StepGeom_Direction &
	:rtype: None
") SetExtrudedDirection;
		void SetExtrudedDirection (const Handle_StepGeom_Direction & aExtrudedDirection);
		%feature("compactdefaultargs") ExtrudedDirection;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") ExtrudedDirection;
		Handle_StepGeom_Direction ExtrudedDirection ();
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	:param aDepth:
	:type aDepth: float
	:rtype: None
") SetDepth;
		void SetDepth (const Standard_Real aDepth);
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: float
") Depth;
		Standard_Real Depth ();
};


%extend StepShape_ExtrudedAreaSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ExtrudedAreaSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ExtrudedAreaSolid::Handle_StepShape_ExtrudedAreaSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ExtrudedAreaSolid;
class Handle_StepShape_ExtrudedAreaSolid : public Handle_StepShape_SweptAreaSolid {

    public:
        // constructors
        Handle_StepShape_ExtrudedAreaSolid();
        Handle_StepShape_ExtrudedAreaSolid(const Handle_StepShape_ExtrudedAreaSolid &aHandle);
        Handle_StepShape_ExtrudedAreaSolid(const StepShape_ExtrudedAreaSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ExtrudedAreaSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ExtrudedAreaSolid {
    StepShape_ExtrudedAreaSolid* _get_reference() {
    return (StepShape_ExtrudedAreaSolid*)$self->Access();
    }
};

%extend Handle_StepShape_ExtrudedAreaSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ExtrudedAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_ExtrudedFaceSolid;
class StepShape_ExtrudedFaceSolid : public StepShape_SweptFaceSolid {
	public:
		%feature("compactdefaultargs") StepShape_ExtrudedFaceSolid;
		%feature("autodoc", "	* Returns a ExtrudedFaceSolid

	:rtype: None
") StepShape_ExtrudedFaceSolid;
		 StepShape_ExtrudedFaceSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepShape_FaceSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_FaceSurface & aSweptArea);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepShape_FaceSurface &
	:param aExtrudedDirection:
	:type aExtrudedDirection: Handle_StepGeom_Direction &
	:param aDepth:
	:type aDepth: float
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_FaceSurface & aSweptArea,const Handle_StepGeom_Direction & aExtrudedDirection,const Standard_Real aDepth);
		%feature("compactdefaultargs") SetExtrudedDirection;
		%feature("autodoc", "	:param aExtrudedDirection:
	:type aExtrudedDirection: Handle_StepGeom_Direction &
	:rtype: None
") SetExtrudedDirection;
		void SetExtrudedDirection (const Handle_StepGeom_Direction & aExtrudedDirection);
		%feature("compactdefaultargs") ExtrudedDirection;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") ExtrudedDirection;
		Handle_StepGeom_Direction ExtrudedDirection ();
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	:param aDepth:
	:type aDepth: float
	:rtype: None
") SetDepth;
		void SetDepth (const Standard_Real aDepth);
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: float
") Depth;
		Standard_Real Depth ();
};


%extend StepShape_ExtrudedFaceSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_ExtrudedFaceSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_ExtrudedFaceSolid::Handle_StepShape_ExtrudedFaceSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_ExtrudedFaceSolid;
class Handle_StepShape_ExtrudedFaceSolid : public Handle_StepShape_SweptFaceSolid {

    public:
        // constructors
        Handle_StepShape_ExtrudedFaceSolid();
        Handle_StepShape_ExtrudedFaceSolid(const Handle_StepShape_ExtrudedFaceSolid &aHandle);
        Handle_StepShape_ExtrudedFaceSolid(const StepShape_ExtrudedFaceSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_ExtrudedFaceSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_ExtrudedFaceSolid {
    StepShape_ExtrudedFaceSolid* _get_reference() {
    return (StepShape_ExtrudedFaceSolid*)$self->Access();
    }
};

%extend Handle_StepShape_ExtrudedFaceSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_ExtrudedFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_FaceOuterBound;
class StepShape_FaceOuterBound : public StepShape_FaceBound {
	public:
		%feature("compactdefaultargs") StepShape_FaceOuterBound;
		%feature("autodoc", "	* Returns a FaceOuterBound

	:rtype: None
") StepShape_FaceOuterBound;
		 StepShape_FaceOuterBound ();
};


%extend StepShape_FaceOuterBound {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_FaceOuterBound(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_FaceOuterBound::Handle_StepShape_FaceOuterBound %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_FaceOuterBound;
class Handle_StepShape_FaceOuterBound : public Handle_StepShape_FaceBound {

    public:
        // constructors
        Handle_StepShape_FaceOuterBound();
        Handle_StepShape_FaceOuterBound(const Handle_StepShape_FaceOuterBound &aHandle);
        Handle_StepShape_FaceOuterBound(const StepShape_FaceOuterBound *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_FaceOuterBound DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_FaceOuterBound {
    StepShape_FaceOuterBound* _get_reference() {
    return (StepShape_FaceOuterBound*)$self->Access();
    }
};

%extend Handle_StepShape_FaceOuterBound {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_FaceOuterBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_FaceSurface;
class StepShape_FaceSurface : public StepShape_Face {
	public:
		%feature("compactdefaultargs") StepShape_FaceSurface;
		%feature("autodoc", "	* Returns a FaceSurface

	:rtype: None
") StepShape_FaceSurface;
		 StepShape_FaceSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBounds:
	:type aBounds: Handle_StepShape_HArray1OfFaceBound &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfFaceBound & aBounds);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBounds:
	:type aBounds: Handle_StepShape_HArray1OfFaceBound &
	:param aFaceGeometry:
	:type aFaceGeometry: Handle_StepGeom_Surface &
	:param aSameSense:
	:type aSameSense: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfFaceBound & aBounds,const Handle_StepGeom_Surface & aFaceGeometry,const Standard_Boolean aSameSense);
		%feature("compactdefaultargs") SetFaceGeometry;
		%feature("autodoc", "	:param aFaceGeometry:
	:type aFaceGeometry: Handle_StepGeom_Surface &
	:rtype: None
") SetFaceGeometry;
		void SetFaceGeometry (const Handle_StepGeom_Surface & aFaceGeometry);
		%feature("compactdefaultargs") FaceGeometry;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") FaceGeometry;
		Handle_StepGeom_Surface FaceGeometry ();
		%feature("compactdefaultargs") SetSameSense;
		%feature("autodoc", "	:param aSameSense:
	:type aSameSense: bool
	:rtype: None
") SetSameSense;
		void SetSameSense (const Standard_Boolean aSameSense);
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", "	:rtype: bool
") SameSense;
		Standard_Boolean SameSense ();
};


%extend StepShape_FaceSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_FaceSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_FaceSurface::Handle_StepShape_FaceSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_FaceSurface;
class Handle_StepShape_FaceSurface : public Handle_StepShape_Face {

    public:
        // constructors
        Handle_StepShape_FaceSurface();
        Handle_StepShape_FaceSurface(const Handle_StepShape_FaceSurface &aHandle);
        Handle_StepShape_FaceSurface(const StepShape_FaceSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_FaceSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_FaceSurface {
    StepShape_FaceSurface* _get_reference() {
    return (StepShape_FaceSurface*)$self->Access();
    }
};

%extend Handle_StepShape_FaceSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_FaceSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_FacetedBrep;
class StepShape_FacetedBrep : public StepShape_ManifoldSolidBrep {
	public:
		%feature("compactdefaultargs") StepShape_FacetedBrep;
		%feature("autodoc", "	* Returns a FacetedBrep

	:rtype: None
") StepShape_FacetedBrep;
		 StepShape_FacetedBrep ();
};


%extend StepShape_FacetedBrep {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_FacetedBrep(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_FacetedBrep::Handle_StepShape_FacetedBrep %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_FacetedBrep;
class Handle_StepShape_FacetedBrep : public Handle_StepShape_ManifoldSolidBrep {

    public:
        // constructors
        Handle_StepShape_FacetedBrep();
        Handle_StepShape_FacetedBrep(const Handle_StepShape_FacetedBrep &aHandle);
        Handle_StepShape_FacetedBrep(const StepShape_FacetedBrep *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_FacetedBrep DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_FacetedBrep {
    StepShape_FacetedBrep* _get_reference() {
    return (StepShape_FacetedBrep*)$self->Access();
    }
};

%extend Handle_StepShape_FacetedBrep {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_FacetedBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_FacetedBrepAndBrepWithVoids;
class StepShape_FacetedBrepAndBrepWithVoids : public StepShape_ManifoldSolidBrep {
	public:
		%feature("compactdefaultargs") StepShape_FacetedBrepAndBrepWithVoids;
		%feature("autodoc", "	* Returns a FacetedBrepAndBrepWithVoids

	:rtype: None
") StepShape_FacetedBrepAndBrepWithVoids;
		 StepShape_FacetedBrepAndBrepWithVoids ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOuter:
	:type aOuter: Handle_StepShape_ClosedShell &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_ClosedShell & aOuter);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOuter:
	:type aOuter: Handle_StepShape_ClosedShell &
	:param aFacetedBrep:
	:type aFacetedBrep: Handle_StepShape_FacetedBrep &
	:param aBrepWithVoids:
	:type aBrepWithVoids: Handle_StepShape_BrepWithVoids &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_ClosedShell & aOuter,const Handle_StepShape_FacetedBrep & aFacetedBrep,const Handle_StepShape_BrepWithVoids & aBrepWithVoids);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOuter:
	:type aOuter: Handle_StepShape_ClosedShell &
	:param aVoids:
	:type aVoids: Handle_StepShape_HArray1OfOrientedClosedShell &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_ClosedShell & aOuter,const Handle_StepShape_HArray1OfOrientedClosedShell & aVoids);
		%feature("compactdefaultargs") SetFacetedBrep;
		%feature("autodoc", "	:param aFacetedBrep:
	:type aFacetedBrep: Handle_StepShape_FacetedBrep &
	:rtype: None
") SetFacetedBrep;
		void SetFacetedBrep (const Handle_StepShape_FacetedBrep & aFacetedBrep);
		%feature("compactdefaultargs") FacetedBrep;
		%feature("autodoc", "	:rtype: Handle_StepShape_FacetedBrep
") FacetedBrep;
		Handle_StepShape_FacetedBrep FacetedBrep ();
		%feature("compactdefaultargs") SetBrepWithVoids;
		%feature("autodoc", "	:param aBrepWithVoids:
	:type aBrepWithVoids: Handle_StepShape_BrepWithVoids &
	:rtype: None
") SetBrepWithVoids;
		void SetBrepWithVoids (const Handle_StepShape_BrepWithVoids & aBrepWithVoids);
		%feature("compactdefaultargs") BrepWithVoids;
		%feature("autodoc", "	:rtype: Handle_StepShape_BrepWithVoids
") BrepWithVoids;
		Handle_StepShape_BrepWithVoids BrepWithVoids ();
		%feature("compactdefaultargs") SetVoids;
		%feature("autodoc", "	:param aVoids:
	:type aVoids: Handle_StepShape_HArray1OfOrientedClosedShell &
	:rtype: None
") SetVoids;
		void SetVoids (const Handle_StepShape_HArray1OfOrientedClosedShell & aVoids);
		%feature("compactdefaultargs") Voids;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfOrientedClosedShell
") Voids;
		Handle_StepShape_HArray1OfOrientedClosedShell Voids ();
		%feature("compactdefaultargs") VoidsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_OrientedClosedShell
") VoidsValue;
		Handle_StepShape_OrientedClosedShell VoidsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbVoids;
		%feature("autodoc", "	:rtype: int
") NbVoids;
		Standard_Integer NbVoids ();
};


%extend StepShape_FacetedBrepAndBrepWithVoids {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_FacetedBrepAndBrepWithVoids(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_FacetedBrepAndBrepWithVoids::Handle_StepShape_FacetedBrepAndBrepWithVoids %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_FacetedBrepAndBrepWithVoids;
class Handle_StepShape_FacetedBrepAndBrepWithVoids : public Handle_StepShape_ManifoldSolidBrep {

    public:
        // constructors
        Handle_StepShape_FacetedBrepAndBrepWithVoids();
        Handle_StepShape_FacetedBrepAndBrepWithVoids(const Handle_StepShape_FacetedBrepAndBrepWithVoids &aHandle);
        Handle_StepShape_FacetedBrepAndBrepWithVoids(const StepShape_FacetedBrepAndBrepWithVoids *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_FacetedBrepAndBrepWithVoids DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_FacetedBrepAndBrepWithVoids {
    StepShape_FacetedBrepAndBrepWithVoids* _get_reference() {
    return (StepShape_FacetedBrepAndBrepWithVoids*)$self->Access();
    }
};

%extend Handle_StepShape_FacetedBrepAndBrepWithVoids {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_FacetedBrepAndBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_OpenShell;
class StepShape_OpenShell : public StepShape_ConnectedFaceSet {
	public:
		%feature("compactdefaultargs") StepShape_OpenShell;
		%feature("autodoc", "	* Returns a OpenShell

	:rtype: None
") StepShape_OpenShell;
		 StepShape_OpenShell ();
};


%extend StepShape_OpenShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_OpenShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_OpenShell::Handle_StepShape_OpenShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_OpenShell;
class Handle_StepShape_OpenShell : public Handle_StepShape_ConnectedFaceSet {

    public:
        // constructors
        Handle_StepShape_OpenShell();
        Handle_StepShape_OpenShell(const Handle_StepShape_OpenShell &aHandle);
        Handle_StepShape_OpenShell(const StepShape_OpenShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_OpenShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_OpenShell {
    StepShape_OpenShell* _get_reference() {
    return (StepShape_OpenShell*)$self->Access();
    }
};

%extend Handle_StepShape_OpenShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_OpenShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_OrientedEdge;
class StepShape_OrientedEdge : public StepShape_Edge {
	public:
		%feature("compactdefaultargs") StepShape_OrientedEdge;
		%feature("autodoc", "	* Returns a OrientedEdge

	:rtype: None
") StepShape_OrientedEdge;
		 StepShape_OrientedEdge ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aEdgeElement:
	:type aEdgeElement: Handle_StepShape_Edge &
	:param aOrientation:
	:type aOrientation: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_Edge & aEdgeElement,const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") SetEdgeElement;
		%feature("autodoc", "	:param aEdgeElement:
	:type aEdgeElement: Handle_StepShape_Edge &
	:rtype: None
") SetEdgeElement;
		void SetEdgeElement (const Handle_StepShape_Edge & aEdgeElement);
		%feature("compactdefaultargs") EdgeElement;
		%feature("autodoc", "	:rtype: Handle_StepShape_Edge
") EdgeElement;
		Handle_StepShape_Edge EdgeElement ();
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: bool
") Orientation;
		Standard_Boolean Orientation ();
		%feature("compactdefaultargs") SetEdgeStart;
		%feature("autodoc", "	:param aEdgeStart:
	:type aEdgeStart: Handle_StepShape_Vertex &
	:rtype: void
") SetEdgeStart;
		virtual void SetEdgeStart (const Handle_StepShape_Vertex & aEdgeStart);
		%feature("compactdefaultargs") EdgeStart;
		%feature("autodoc", "	:rtype: Handle_StepShape_Vertex
") EdgeStart;
		virtual Handle_StepShape_Vertex EdgeStart ();
		%feature("compactdefaultargs") SetEdgeEnd;
		%feature("autodoc", "	:param aEdgeEnd:
	:type aEdgeEnd: Handle_StepShape_Vertex &
	:rtype: void
") SetEdgeEnd;
		virtual void SetEdgeEnd (const Handle_StepShape_Vertex & aEdgeEnd);
		%feature("compactdefaultargs") EdgeEnd;
		%feature("autodoc", "	:rtype: Handle_StepShape_Vertex
") EdgeEnd;
		virtual Handle_StepShape_Vertex EdgeEnd ();
};


%extend StepShape_OrientedEdge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_OrientedEdge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_OrientedEdge::Handle_StepShape_OrientedEdge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_OrientedEdge;
class Handle_StepShape_OrientedEdge : public Handle_StepShape_Edge {

    public:
        // constructors
        Handle_StepShape_OrientedEdge();
        Handle_StepShape_OrientedEdge(const Handle_StepShape_OrientedEdge &aHandle);
        Handle_StepShape_OrientedEdge(const StepShape_OrientedEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_OrientedEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_OrientedEdge {
    StepShape_OrientedEdge* _get_reference() {
    return (StepShape_OrientedEdge*)$self->Access();
    }
};

%extend Handle_StepShape_OrientedEdge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_OrientedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_OrientedFace;
class StepShape_OrientedFace : public StepShape_Face {
	public:
		%feature("compactdefaultargs") StepShape_OrientedFace;
		%feature("autodoc", "	* Returns a OrientedFace

	:rtype: None
") StepShape_OrientedFace;
		 StepShape_OrientedFace ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBounds:
	:type aBounds: Handle_StepShape_HArray1OfFaceBound &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfFaceBound & aBounds);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aFaceElement:
	:type aFaceElement: Handle_StepShape_Face &
	:param aOrientation:
	:type aOrientation: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_Face & aFaceElement,const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") SetFaceElement;
		%feature("autodoc", "	:param aFaceElement:
	:type aFaceElement: Handle_StepShape_Face &
	:rtype: None
") SetFaceElement;
		void SetFaceElement (const Handle_StepShape_Face & aFaceElement);
		%feature("compactdefaultargs") FaceElement;
		%feature("autodoc", "	:rtype: Handle_StepShape_Face
") FaceElement;
		Handle_StepShape_Face FaceElement ();
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: bool
") Orientation;
		Standard_Boolean Orientation ();
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "	:param aBounds:
	:type aBounds: Handle_StepShape_HArray1OfFaceBound &
	:rtype: void
") SetBounds;
		virtual void SetBounds (const Handle_StepShape_HArray1OfFaceBound & aBounds);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfFaceBound
") Bounds;
		virtual Handle_StepShape_HArray1OfFaceBound Bounds ();
		%feature("compactdefaultargs") BoundsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_FaceBound
") BoundsValue;
		virtual Handle_StepShape_FaceBound BoundsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbBounds;
		%feature("autodoc", "	:rtype: int
") NbBounds;
		virtual Standard_Integer NbBounds ();
};


%extend StepShape_OrientedFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_OrientedFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_OrientedFace::Handle_StepShape_OrientedFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_OrientedFace;
class Handle_StepShape_OrientedFace : public Handle_StepShape_Face {

    public:
        // constructors
        Handle_StepShape_OrientedFace();
        Handle_StepShape_OrientedFace(const Handle_StepShape_OrientedFace &aHandle);
        Handle_StepShape_OrientedFace(const StepShape_OrientedFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_OrientedFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_OrientedFace {
    StepShape_OrientedFace* _get_reference() {
    return (StepShape_OrientedFace*)$self->Access();
    }
};

%extend Handle_StepShape_OrientedFace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_OrientedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_OrientedPath;
class StepShape_OrientedPath : public StepShape_Path {
	public:
		%feature("compactdefaultargs") StepShape_OrientedPath;
		%feature("autodoc", "	* Returns a OrientedPath

	:rtype: None
") StepShape_OrientedPath;
		 StepShape_OrientedPath ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aEdgeList:
	:type aEdgeList: Handle_StepShape_HArray1OfOrientedEdge &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfOrientedEdge & aEdgeList);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPathElement:
	:type aPathElement: Handle_StepShape_EdgeLoop &
	:param aOrientation:
	:type aOrientation: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_EdgeLoop & aPathElement,const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") SetPathElement;
		%feature("autodoc", "	:param aPathElement:
	:type aPathElement: Handle_StepShape_EdgeLoop &
	:rtype: None
") SetPathElement;
		void SetPathElement (const Handle_StepShape_EdgeLoop & aPathElement);
		%feature("compactdefaultargs") PathElement;
		%feature("autodoc", "	:rtype: Handle_StepShape_EdgeLoop
") PathElement;
		Handle_StepShape_EdgeLoop PathElement ();
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: bool
") Orientation;
		Standard_Boolean Orientation ();
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", "	:param aEdgeList:
	:type aEdgeList: Handle_StepShape_HArray1OfOrientedEdge &
	:rtype: void
") SetEdgeList;
		virtual void SetEdgeList (const Handle_StepShape_HArray1OfOrientedEdge & aEdgeList);
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfOrientedEdge
") EdgeList;
		virtual Handle_StepShape_HArray1OfOrientedEdge EdgeList ();
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_OrientedEdge
") EdgeListValue;
		virtual Handle_StepShape_OrientedEdge EdgeListValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "	:rtype: int
") NbEdgeList;
		virtual Standard_Integer NbEdgeList ();
};


%extend StepShape_OrientedPath {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_OrientedPath(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_OrientedPath::Handle_StepShape_OrientedPath %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_OrientedPath;
class Handle_StepShape_OrientedPath : public Handle_StepShape_Path {

    public:
        // constructors
        Handle_StepShape_OrientedPath();
        Handle_StepShape_OrientedPath(const Handle_StepShape_OrientedPath &aHandle);
        Handle_StepShape_OrientedPath(const StepShape_OrientedPath *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_OrientedPath DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_OrientedPath {
    StepShape_OrientedPath* _get_reference() {
    return (StepShape_OrientedPath*)$self->Access();
    }
};

%extend Handle_StepShape_OrientedPath {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_OrientedPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_PolyLoop;
class StepShape_PolyLoop : public StepShape_Loop {
	public:
		%feature("compactdefaultargs") StepShape_PolyLoop;
		%feature("autodoc", "	* Returns a PolyLoop

	:rtype: None
") StepShape_PolyLoop;
		 StepShape_PolyLoop ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPolygon:
	:type aPolygon: Handle_StepGeom_HArray1OfCartesianPoint &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_HArray1OfCartesianPoint & aPolygon);
		%feature("compactdefaultargs") SetPolygon;
		%feature("autodoc", "	:param aPolygon:
	:type aPolygon: Handle_StepGeom_HArray1OfCartesianPoint &
	:rtype: None
") SetPolygon;
		void SetPolygon (const Handle_StepGeom_HArray1OfCartesianPoint & aPolygon);
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray1OfCartesianPoint
") Polygon;
		Handle_StepGeom_HArray1OfCartesianPoint Polygon ();
		%feature("compactdefaultargs") PolygonValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepGeom_CartesianPoint
") PolygonValue;
		Handle_StepGeom_CartesianPoint PolygonValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbPolygon;
		%feature("autodoc", "	:rtype: int
") NbPolygon;
		Standard_Integer NbPolygon ();
};


%extend StepShape_PolyLoop {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_PolyLoop(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_PolyLoop::Handle_StepShape_PolyLoop %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_PolyLoop;
class Handle_StepShape_PolyLoop : public Handle_StepShape_Loop {

    public:
        // constructors
        Handle_StepShape_PolyLoop();
        Handle_StepShape_PolyLoop(const Handle_StepShape_PolyLoop &aHandle);
        Handle_StepShape_PolyLoop(const StepShape_PolyLoop *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_PolyLoop DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_PolyLoop {
    StepShape_PolyLoop* _get_reference() {
    return (StepShape_PolyLoop*)$self->Access();
    }
};

%extend Handle_StepShape_PolyLoop {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_PolyLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_RevolvedAreaSolid;
class StepShape_RevolvedAreaSolid : public StepShape_SweptAreaSolid {
	public:
		%feature("compactdefaultargs") StepShape_RevolvedAreaSolid;
		%feature("autodoc", "	* Returns a RevolvedAreaSolid

	:rtype: None
") StepShape_RevolvedAreaSolid;
		 StepShape_RevolvedAreaSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepGeom_CurveBoundedSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CurveBoundedSurface & aSweptArea);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepGeom_CurveBoundedSurface &
	:param aAxis:
	:type aAxis: Handle_StepGeom_Axis1Placement &
	:param aAngle:
	:type aAngle: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CurveBoundedSurface & aSweptArea,const Handle_StepGeom_Axis1Placement & aAxis,const Standard_Real aAngle);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	:param aAxis:
	:type aAxis: Handle_StepGeom_Axis1Placement &
	:rtype: None
") SetAxis;
		void SetAxis (const Handle_StepGeom_Axis1Placement & aAxis);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis1Placement
") Axis;
		Handle_StepGeom_Axis1Placement Axis ();
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param aAngle:
	:type aAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real aAngle);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
};


%extend StepShape_RevolvedAreaSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_RevolvedAreaSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_RevolvedAreaSolid::Handle_StepShape_RevolvedAreaSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_RevolvedAreaSolid;
class Handle_StepShape_RevolvedAreaSolid : public Handle_StepShape_SweptAreaSolid {

    public:
        // constructors
        Handle_StepShape_RevolvedAreaSolid();
        Handle_StepShape_RevolvedAreaSolid(const Handle_StepShape_RevolvedAreaSolid &aHandle);
        Handle_StepShape_RevolvedAreaSolid(const StepShape_RevolvedAreaSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_RevolvedAreaSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_RevolvedAreaSolid {
    StepShape_RevolvedAreaSolid* _get_reference() {
    return (StepShape_RevolvedAreaSolid*)$self->Access();
    }
};

%extend Handle_StepShape_RevolvedAreaSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_RevolvedAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_RevolvedFaceSolid;
class StepShape_RevolvedFaceSolid : public StepShape_SweptFaceSolid {
	public:
		%feature("compactdefaultargs") StepShape_RevolvedFaceSolid;
		%feature("autodoc", "	* Returns a RevolvedFaceSolid

	:rtype: None
") StepShape_RevolvedFaceSolid;
		 StepShape_RevolvedFaceSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepShape_FaceSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_FaceSurface & aSweptArea);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptArea:
	:type aSweptArea: Handle_StepShape_FaceSurface &
	:param aAxis:
	:type aAxis: Handle_StepGeom_Axis1Placement &
	:param aAngle:
	:type aAngle: float
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_FaceSurface & aSweptArea,const Handle_StepGeom_Axis1Placement & aAxis,const Standard_Real aAngle);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	:param aAxis:
	:type aAxis: Handle_StepGeom_Axis1Placement &
	:rtype: None
") SetAxis;
		void SetAxis (const Handle_StepGeom_Axis1Placement & aAxis);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis1Placement
") Axis;
		Handle_StepGeom_Axis1Placement Axis ();
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param aAngle:
	:type aAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real aAngle);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
};


%extend StepShape_RevolvedFaceSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_RevolvedFaceSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_RevolvedFaceSolid::Handle_StepShape_RevolvedFaceSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_RevolvedFaceSolid;
class Handle_StepShape_RevolvedFaceSolid : public Handle_StepShape_SweptFaceSolid {

    public:
        // constructors
        Handle_StepShape_RevolvedFaceSolid();
        Handle_StepShape_RevolvedFaceSolid(const Handle_StepShape_RevolvedFaceSolid &aHandle);
        Handle_StepShape_RevolvedFaceSolid(const StepShape_RevolvedFaceSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_RevolvedFaceSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_RevolvedFaceSolid {
    StepShape_RevolvedFaceSolid* _get_reference() {
    return (StepShape_RevolvedFaceSolid*)$self->Access();
    }
};

%extend Handle_StepShape_RevolvedFaceSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_RevolvedFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Subedge;
class StepShape_Subedge : public StepShape_Edge {
	public:
		%feature("compactdefaultargs") StepShape_Subedge;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_Subedge;
		 StepShape_Subedge ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aEdge_EdgeStart:
	:type aEdge_EdgeStart: Handle_StepShape_Vertex &
	:param aEdge_EdgeEnd:
	:type aEdge_EdgeEnd: Handle_StepShape_Vertex &
	:param aParentEdge:
	:type aParentEdge: Handle_StepShape_Edge &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepShape_Vertex & aEdge_EdgeStart,const Handle_StepShape_Vertex & aEdge_EdgeEnd,const Handle_StepShape_Edge & aParentEdge);
		%feature("compactdefaultargs") ParentEdge;
		%feature("autodoc", "	* Returns field ParentEdge

	:rtype: Handle_StepShape_Edge
") ParentEdge;
		Handle_StepShape_Edge ParentEdge ();
		%feature("compactdefaultargs") SetParentEdge;
		%feature("autodoc", "	* Set field ParentEdge

	:param ParentEdge:
	:type ParentEdge: Handle_StepShape_Edge &
	:rtype: None
") SetParentEdge;
		void SetParentEdge (const Handle_StepShape_Edge & ParentEdge);
};


%extend StepShape_Subedge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Subedge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Subedge::Handle_StepShape_Subedge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Subedge;
class Handle_StepShape_Subedge : public Handle_StepShape_Edge {

    public:
        // constructors
        Handle_StepShape_Subedge();
        Handle_StepShape_Subedge(const Handle_StepShape_Subedge &aHandle);
        Handle_StepShape_Subedge(const StepShape_Subedge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Subedge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Subedge {
    StepShape_Subedge* _get_reference() {
    return (StepShape_Subedge*)$self->Access();
    }
};

%extend Handle_StepShape_Subedge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Subedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_Subface;
class StepShape_Subface : public StepShape_Face {
	public:
		%feature("compactdefaultargs") StepShape_Subface;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_Subface;
		 StepShape_Subface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFace_Bounds:
	:type aFace_Bounds: Handle_StepShape_HArray1OfFaceBound &
	:param aParentFace:
	:type aParentFace: Handle_StepShape_Face &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepShape_HArray1OfFaceBound & aFace_Bounds,const Handle_StepShape_Face & aParentFace);
		%feature("compactdefaultargs") ParentFace;
		%feature("autodoc", "	* Returns field ParentFace

	:rtype: Handle_StepShape_Face
") ParentFace;
		Handle_StepShape_Face ParentFace ();
		%feature("compactdefaultargs") SetParentFace;
		%feature("autodoc", "	* Set field ParentFace

	:param ParentFace:
	:type ParentFace: Handle_StepShape_Face &
	:rtype: None
") SetParentFace;
		void SetParentFace (const Handle_StepShape_Face & ParentFace);
};


%extend StepShape_Subface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_Subface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_Subface::Handle_StepShape_Subface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_Subface;
class Handle_StepShape_Subface : public Handle_StepShape_Face {

    public:
        // constructors
        Handle_StepShape_Subface();
        Handle_StepShape_Subface(const Handle_StepShape_Subface &aHandle);
        Handle_StepShape_Subface(const StepShape_Subface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_Subface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_Subface {
    StepShape_Subface* _get_reference() {
    return (StepShape_Subface*)$self->Access();
    }
};

%extend Handle_StepShape_Subface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_Subface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_VertexLoop;
class StepShape_VertexLoop : public StepShape_Loop {
	public:
		%feature("compactdefaultargs") StepShape_VertexLoop;
		%feature("autodoc", "	* Returns a VertexLoop

	:rtype: None
") StepShape_VertexLoop;
		 StepShape_VertexLoop ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLoopVertex:
	:type aLoopVertex: Handle_StepShape_Vertex &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_Vertex & aLoopVertex);
		%feature("compactdefaultargs") SetLoopVertex;
		%feature("autodoc", "	:param aLoopVertex:
	:type aLoopVertex: Handle_StepShape_Vertex &
	:rtype: None
") SetLoopVertex;
		void SetLoopVertex (const Handle_StepShape_Vertex & aLoopVertex);
		%feature("compactdefaultargs") LoopVertex;
		%feature("autodoc", "	:rtype: Handle_StepShape_Vertex
") LoopVertex;
		Handle_StepShape_Vertex LoopVertex ();
};


%extend StepShape_VertexLoop {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_VertexLoop(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_VertexLoop::Handle_StepShape_VertexLoop %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_VertexLoop;
class Handle_StepShape_VertexLoop : public Handle_StepShape_Loop {

    public:
        // constructors
        Handle_StepShape_VertexLoop();
        Handle_StepShape_VertexLoop(const Handle_StepShape_VertexLoop &aHandle);
        Handle_StepShape_VertexLoop(const StepShape_VertexLoop *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_VertexLoop DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_VertexLoop {
    StepShape_VertexLoop* _get_reference() {
    return (StepShape_VertexLoop*)$self->Access();
    }
};

%extend Handle_StepShape_VertexLoop {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_VertexLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_VertexPoint;
class StepShape_VertexPoint : public StepShape_Vertex {
	public:
		%feature("compactdefaultargs") StepShape_VertexPoint;
		%feature("autodoc", "	* Returns a VertexPoint

	:rtype: None
") StepShape_VertexPoint;
		 StepShape_VertexPoint ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aVertexGeometry:
	:type aVertexGeometry: Handle_StepGeom_Point &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Point & aVertexGeometry);
		%feature("compactdefaultargs") SetVertexGeometry;
		%feature("autodoc", "	:param aVertexGeometry:
	:type aVertexGeometry: Handle_StepGeom_Point &
	:rtype: None
") SetVertexGeometry;
		void SetVertexGeometry (const Handle_StepGeom_Point & aVertexGeometry);
		%feature("compactdefaultargs") VertexGeometry;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Point
") VertexGeometry;
		Handle_StepGeom_Point VertexGeometry ();
};


%extend StepShape_VertexPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_VertexPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_VertexPoint::Handle_StepShape_VertexPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_VertexPoint;
class Handle_StepShape_VertexPoint : public Handle_StepShape_Vertex {

    public:
        // constructors
        Handle_StepShape_VertexPoint();
        Handle_StepShape_VertexPoint(const Handle_StepShape_VertexPoint &aHandle);
        Handle_StepShape_VertexPoint(const StepShape_VertexPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_VertexPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_VertexPoint {
    StepShape_VertexPoint* _get_reference() {
    return (StepShape_VertexPoint*)$self->Access();
    }
};

%extend Handle_StepShape_VertexPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_VertexPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_AdvancedFace;
class StepShape_AdvancedFace : public StepShape_FaceSurface {
	public:
		%feature("compactdefaultargs") StepShape_AdvancedFace;
		%feature("autodoc", "	* Returns a AdvancedFace

	:rtype: None
") StepShape_AdvancedFace;
		 StepShape_AdvancedFace ();
};


%extend StepShape_AdvancedFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_AdvancedFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_AdvancedFace::Handle_StepShape_AdvancedFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_AdvancedFace;
class Handle_StepShape_AdvancedFace : public Handle_StepShape_FaceSurface {

    public:
        // constructors
        Handle_StepShape_AdvancedFace();
        Handle_StepShape_AdvancedFace(const Handle_StepShape_AdvancedFace &aHandle);
        Handle_StepShape_AdvancedFace(const StepShape_AdvancedFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_AdvancedFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_AdvancedFace {
    StepShape_AdvancedFace* _get_reference() {
    return (StepShape_AdvancedFace*)$self->Access();
    }
};

%extend Handle_StepShape_AdvancedFace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_AdvancedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_OrientedClosedShell;
class StepShape_OrientedClosedShell : public StepShape_ClosedShell {
	public:
		%feature("compactdefaultargs") StepShape_OrientedClosedShell;
		%feature("autodoc", "	* Returns a OrientedClosedShell

	:rtype: None
") StepShape_OrientedClosedShell;
		 StepShape_OrientedClosedShell ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCfsFaces:
	:type aCfsFaces: Handle_StepShape_HArray1OfFace &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfFace & aCfsFaces);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aClosedShellElement:
	:type aClosedShellElement: Handle_StepShape_ClosedShell &
	:param aOrientation:
	:type aOrientation: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_ClosedShell & aClosedShellElement,const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") SetClosedShellElement;
		%feature("autodoc", "	:param aClosedShellElement:
	:type aClosedShellElement: Handle_StepShape_ClosedShell &
	:rtype: None
") SetClosedShellElement;
		void SetClosedShellElement (const Handle_StepShape_ClosedShell & aClosedShellElement);
		%feature("compactdefaultargs") ClosedShellElement;
		%feature("autodoc", "	:rtype: Handle_StepShape_ClosedShell
") ClosedShellElement;
		Handle_StepShape_ClosedShell ClosedShellElement ();
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: bool
") Orientation;
		Standard_Boolean Orientation ();
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", "	:param aCfsFaces:
	:type aCfsFaces: Handle_StepShape_HArray1OfFace &
	:rtype: void
") SetCfsFaces;
		virtual void SetCfsFaces (const Handle_StepShape_HArray1OfFace & aCfsFaces);
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfFace
") CfsFaces;
		virtual Handle_StepShape_HArray1OfFace CfsFaces ();
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_Face
") CfsFacesValue;
		virtual Handle_StepShape_Face CfsFacesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "	:rtype: int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces ();
};


%extend StepShape_OrientedClosedShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_OrientedClosedShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_OrientedClosedShell::Handle_StepShape_OrientedClosedShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_OrientedClosedShell;
class Handle_StepShape_OrientedClosedShell : public Handle_StepShape_ClosedShell {

    public:
        // constructors
        Handle_StepShape_OrientedClosedShell();
        Handle_StepShape_OrientedClosedShell(const Handle_StepShape_OrientedClosedShell &aHandle);
        Handle_StepShape_OrientedClosedShell(const StepShape_OrientedClosedShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_OrientedClosedShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_OrientedClosedShell {
    StepShape_OrientedClosedShell* _get_reference() {
    return (StepShape_OrientedClosedShell*)$self->Access();
    }
};

%extend Handle_StepShape_OrientedClosedShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_OrientedClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_OrientedOpenShell;
class StepShape_OrientedOpenShell : public StepShape_OpenShell {
	public:
		%feature("compactdefaultargs") StepShape_OrientedOpenShell;
		%feature("autodoc", "	* Returns a OrientedOpenShell

	:rtype: None
") StepShape_OrientedOpenShell;
		 StepShape_OrientedOpenShell ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCfsFaces:
	:type aCfsFaces: Handle_StepShape_HArray1OfFace &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_HArray1OfFace & aCfsFaces);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOpenShellElement:
	:type aOpenShellElement: Handle_StepShape_OpenShell &
	:param aOrientation:
	:type aOrientation: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepShape_OpenShell & aOpenShellElement,const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") SetOpenShellElement;
		%feature("autodoc", "	:param aOpenShellElement:
	:type aOpenShellElement: Handle_StepShape_OpenShell &
	:rtype: None
") SetOpenShellElement;
		void SetOpenShellElement (const Handle_StepShape_OpenShell & aOpenShellElement);
		%feature("compactdefaultargs") OpenShellElement;
		%feature("autodoc", "	:rtype: Handle_StepShape_OpenShell
") OpenShellElement;
		Handle_StepShape_OpenShell OpenShellElement ();
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: bool
") Orientation;
		Standard_Boolean Orientation ();
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", "	:param aCfsFaces:
	:type aCfsFaces: Handle_StepShape_HArray1OfFace &
	:rtype: void
") SetCfsFaces;
		virtual void SetCfsFaces (const Handle_StepShape_HArray1OfFace & aCfsFaces);
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "	:rtype: Handle_StepShape_HArray1OfFace
") CfsFaces;
		virtual Handle_StepShape_HArray1OfFace CfsFaces ();
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepShape_Face
") CfsFacesValue;
		virtual Handle_StepShape_Face CfsFacesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "	:rtype: int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces ();
};


%extend StepShape_OrientedOpenShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_OrientedOpenShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_OrientedOpenShell::Handle_StepShape_OrientedOpenShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_OrientedOpenShell;
class Handle_StepShape_OrientedOpenShell : public Handle_StepShape_OpenShell {

    public:
        // constructors
        Handle_StepShape_OrientedOpenShell();
        Handle_StepShape_OrientedOpenShell(const Handle_StepShape_OrientedOpenShell &aHandle);
        Handle_StepShape_OrientedOpenShell(const StepShape_OrientedOpenShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_OrientedOpenShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_OrientedOpenShell {
    StepShape_OrientedOpenShell* _get_reference() {
    return (StepShape_OrientedOpenShell*)$self->Access();
    }
};

%extend Handle_StepShape_OrientedOpenShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_OrientedOpenShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepShape_SeamEdge;
class StepShape_SeamEdge : public StepShape_OrientedEdge {
	public:
		%feature("compactdefaultargs") StepShape_SeamEdge;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepShape_SeamEdge;
		 StepShape_SeamEdge ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aOrientedEdge_EdgeElement:
	:type aOrientedEdge_EdgeElement: Handle_StepShape_Edge &
	:param aOrientedEdge_Orientation:
	:type aOrientedEdge_Orientation: bool
	:param aPcurveReference:
	:type aPcurveReference: Handle_StepGeom_Pcurve &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepShape_Edge & aOrientedEdge_EdgeElement,const Standard_Boolean aOrientedEdge_Orientation,const Handle_StepGeom_Pcurve & aPcurveReference);
		%feature("compactdefaultargs") PcurveReference;
		%feature("autodoc", "	* Returns field PcurveReference

	:rtype: Handle_StepGeom_Pcurve
") PcurveReference;
		Handle_StepGeom_Pcurve PcurveReference ();
		%feature("compactdefaultargs") SetPcurveReference;
		%feature("autodoc", "	* Set field PcurveReference

	:param PcurveReference:
	:type PcurveReference: Handle_StepGeom_Pcurve &
	:rtype: None
") SetPcurveReference;
		void SetPcurveReference (const Handle_StepGeom_Pcurve & PcurveReference);
};


%extend StepShape_SeamEdge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepShape_SeamEdge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepShape_SeamEdge::Handle_StepShape_SeamEdge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepShape_SeamEdge;
class Handle_StepShape_SeamEdge : public Handle_StepShape_OrientedEdge {

    public:
        // constructors
        Handle_StepShape_SeamEdge();
        Handle_StepShape_SeamEdge(const Handle_StepShape_SeamEdge &aHandle);
        Handle_StepShape_SeamEdge(const StepShape_SeamEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepShape_SeamEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepShape_SeamEdge {
    StepShape_SeamEdge* _get_reference() {
    return (StepShape_SeamEdge*)$self->Access();
    }
};

%extend Handle_StepShape_SeamEdge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepShape_SeamEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
