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
%module ChFiKPart

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

%include ChFiKPart_required_python_modules.i
%include ChFiKPart_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor ChFiKPart_ComputeData;
class ChFiKPart_ComputeData {
	public:
		%feature("autodoc", "Args:
	DStr(TopOpeBRepDS_DataStructure)
	Data(Handle_ChFiDS_SurfData)
	S1(Handle_Adaptor3d_HSurface)
	S2(Handle_Adaptor3d_HSurface)
	Or1(TopAbs_Orientation)
	Or2(TopAbs_Orientation)
	Sp(Handle_ChFiDS_Spine)
	Iedge(Standard_Integer)

Returns:
	static Standard_Boolean

Computes a simple fillet in several particular  
         cases.") Compute;
		static Standard_Boolean Compute (TopOpeBRepDS_DataStructure & DStr,Handle_ChFiDS_SurfData & Data,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Handle_ChFiDS_Spine & Sp,const Standard_Integer Iedge);
		%feature("autodoc", "Args:
	DStr(TopOpeBRepDS_DataStructure)
	Data(Handle_ChFiDS_SurfData)
	S1(Handle_Adaptor3d_HSurface)
	S2(Handle_Adaptor3d_HSurface)
	OrFace1(TopAbs_Orientation)
	OrFace2(TopAbs_Orientation)
	Or1(TopAbs_Orientation)
	Or2(TopAbs_Orientation)
	minRad(Standard_Real)
	majRad(Standard_Real)
	P1S1(gp_Pnt2d)
	P2S1(gp_Pnt2d)
	P1S2(gp_Pnt2d)
	P2S2(gp_Pnt2d)

Returns:
	static Standard_Boolean

Computes a toric or spheric corner fillet.") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const Handle_ChFiDS_SurfData & Data,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Standard_Real minRad,const Standard_Real majRad,const gp_Pnt2d & P1S1,const gp_Pnt2d & P2S1,const gp_Pnt2d & P1S2,const gp_Pnt2d & P2S2);
		%feature("autodoc", "Args:
	DStr(TopOpeBRepDS_DataStructure)
	Data(Handle_ChFiDS_SurfData)
	S1(Handle_Adaptor3d_HSurface)
	S2(Handle_Adaptor3d_HSurface)
	OrFace1(TopAbs_Orientation)
	OrFace2(TopAbs_Orientation)
	Or1(TopAbs_Orientation)
	Or2(TopAbs_Orientation)
	Rad(Standard_Real)
	PS1(gp_Pnt2d)
	P1S2(gp_Pnt2d)
	P2S2(gp_Pnt2d)

Returns:
	static Standard_Boolean

Computes spheric corner fillet with non iso pcurve on S2.") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const Handle_ChFiDS_SurfData & Data,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Standard_Real Rad,const gp_Pnt2d & PS1,const gp_Pnt2d & P1S2,const gp_Pnt2d & P2S2);
		%feature("autodoc", "Args:
	DStr(TopOpeBRepDS_DataStructure)
	Data(Handle_ChFiDS_SurfData)
	S(Handle_Adaptor3d_HSurface)
	S1(Handle_Adaptor3d_HSurface)
	S2(Handle_Adaptor3d_HSurface)
	OfS(TopAbs_Orientation)
	OS(TopAbs_Orientation)
	OS1(TopAbs_Orientation)
	OS2(TopAbs_Orientation)
	Radius(Standard_Real)

Returns:
	static Standard_Boolean

Computes a toric corner rotule.") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const Handle_ChFiDS_SurfData & Data,const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const TopAbs_Orientation OfS,const TopAbs_Orientation OS,const TopAbs_Orientation OS1,const TopAbs_Orientation OS2,const Standard_Real Radius);
};


%feature("shadow") ChFiKPart_ComputeData::~ChFiKPart_ComputeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiKPart_ComputeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiKPart_DataMapIteratorOfRstMap;
class ChFiKPart_DataMapIteratorOfRstMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiKPart_DataMapIteratorOfRstMap;
		 ChFiKPart_DataMapIteratorOfRstMap ();
		%feature("autodoc", "Args:
	aMap(ChFiKPart_RstMap)

Returns:
	None

No detailed docstring for this function.") ChFiKPart_DataMapIteratorOfRstMap;
		 ChFiKPart_DataMapIteratorOfRstMap (const ChFiKPart_RstMap & aMap);
		%feature("autodoc", "Args:
	aMap(ChFiKPart_RstMap)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const ChFiKPart_RstMap & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Value;
		const Handle_Adaptor2d_HCurve2d & Value ();
};


%feature("shadow") ChFiKPart_DataMapIteratorOfRstMap::~ChFiKPart_DataMapIteratorOfRstMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiKPart_DataMapIteratorOfRstMap {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiKPart_DataMapNodeOfRstMap;
class ChFiKPart_DataMapNodeOfRstMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_Adaptor2d_HCurve2d)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ChFiKPart_DataMapNodeOfRstMap;
		 ChFiKPart_DataMapNodeOfRstMap (Standard_Integer &OutValue,const Handle_Adaptor2d_HCurve2d & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Value;
		Handle_Adaptor2d_HCurve2d & Value ();
};


%feature("shadow") ChFiKPart_DataMapNodeOfRstMap::~ChFiKPart_DataMapNodeOfRstMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiKPart_DataMapNodeOfRstMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiKPart_DataMapNodeOfRstMap {
	Handle_ChFiKPart_DataMapNodeOfRstMap GetHandle() {
	return *(Handle_ChFiKPart_DataMapNodeOfRstMap*) &$self;
	}
};

%nodefaultctor Handle_ChFiKPart_DataMapNodeOfRstMap;
class Handle_ChFiKPart_DataMapNodeOfRstMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ChFiKPart_DataMapNodeOfRstMap();
        Handle_ChFiKPart_DataMapNodeOfRstMap(const Handle_ChFiKPart_DataMapNodeOfRstMap &aHandle);
        Handle_ChFiKPart_DataMapNodeOfRstMap(const ChFiKPart_DataMapNodeOfRstMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiKPart_DataMapNodeOfRstMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiKPart_DataMapNodeOfRstMap {
    ChFiKPart_DataMapNodeOfRstMap* GetObject() {
    return (ChFiKPart_DataMapNodeOfRstMap*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiKPart_DataMapNodeOfRstMap::~Handle_ChFiKPart_DataMapNodeOfRstMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiKPart_DataMapNodeOfRstMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiKPart_RstMap;
class ChFiKPart_RstMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") ChFiKPart_RstMap;
		 ChFiKPart_RstMap (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(ChFiKPart_RstMap)

Returns:
	ChFiKPart_RstMap

No detailed docstring for this function.") Assign;
		ChFiKPart_RstMap & Assign (const ChFiKPart_RstMap & Other);
		%feature("autodoc", "Args:
	Other(ChFiKPart_RstMap)

Returns:
	ChFiKPart_RstMap

No detailed docstring for this function.") operator=;
		ChFiKPart_RstMap & operator = (const ChFiKPart_RstMap & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_Adaptor2d_HCurve2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_Adaptor2d_HCurve2d & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Find;
		const Handle_Adaptor2d_HCurve2d & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") ChangeFind;
		Handle_Adaptor2d_HCurve2d & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") ChFiKPart_RstMap::~ChFiKPart_RstMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiKPart_RstMap {
	void _kill_pointed() {
		delete $self;
	}
};
