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
%module (package="OCC") ChFiKPart

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


%include ChFiKPart_headers.i


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
/* end public enums declaration */

class ChFiKPart_ComputeData {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes a simple fillet in several particular cases.

	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure &
	:param Data:
	:type Data: Handle_ChFiDS_SurfData &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Sp:
	:type Sp: Handle_ChFiDS_Spine &
	:param Iedge:
	:type Iedge: int
	:rtype: bool
") Compute;
		static Standard_Boolean Compute (TopOpeBRepDS_DataStructure & DStr,Handle_ChFiDS_SurfData & Data,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Handle_ChFiDS_Spine & Sp,const Standard_Integer Iedge);
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "	* Computes a toric or spheric corner fillet.

	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure &
	:param Data:
	:type Data: Handle_ChFiDS_SurfData &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param OrFace1:
	:type OrFace1: TopAbs_Orientation
	:param OrFace2:
	:type OrFace2: TopAbs_Orientation
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param minRad:
	:type minRad: float
	:param majRad:
	:type majRad: float
	:param P1S1:
	:type P1S1: gp_Pnt2d
	:param P2S1:
	:type P2S1: gp_Pnt2d
	:param P1S2:
	:type P1S2: gp_Pnt2d
	:param P2S2:
	:type P2S2: gp_Pnt2d
	:rtype: bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const Handle_ChFiDS_SurfData & Data,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Standard_Real minRad,const Standard_Real majRad,const gp_Pnt2d & P1S1,const gp_Pnt2d & P2S1,const gp_Pnt2d & P1S2,const gp_Pnt2d & P2S2);
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "	* Computes spheric corner fillet with non iso pcurve on S2.

	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure &
	:param Data:
	:type Data: Handle_ChFiDS_SurfData &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param OrFace1:
	:type OrFace1: TopAbs_Orientation
	:param OrFace2:
	:type OrFace2: TopAbs_Orientation
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Rad:
	:type Rad: float
	:param PS1:
	:type PS1: gp_Pnt2d
	:param P1S2:
	:type P1S2: gp_Pnt2d
	:param P2S2:
	:type P2S2: gp_Pnt2d
	:rtype: bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const Handle_ChFiDS_SurfData & Data,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Standard_Real Rad,const gp_Pnt2d & PS1,const gp_Pnt2d & P1S2,const gp_Pnt2d & P2S2);
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "	* Computes a toric corner rotule.

	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure &
	:param Data:
	:type Data: Handle_ChFiDS_SurfData &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param OfS:
	:type OfS: TopAbs_Orientation
	:param OS:
	:type OS: TopAbs_Orientation
	:param OS1:
	:type OS1: TopAbs_Orientation
	:param OS2:
	:type OS2: TopAbs_Orientation
	:param Radius:
	:type Radius: float
	:rtype: bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const Handle_ChFiDS_SurfData & Data,const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const TopAbs_Orientation OfS,const TopAbs_Orientation OS,const TopAbs_Orientation OS1,const TopAbs_Orientation OS2,const Standard_Real Radius);
};


%extend ChFiKPart_ComputeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiKPart_DataMapIteratorOfRstMap;
class ChFiKPart_DataMapIteratorOfRstMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") ChFiKPart_DataMapIteratorOfRstMap;
		%feature("autodoc", "	:rtype: None
") ChFiKPart_DataMapIteratorOfRstMap;
		 ChFiKPart_DataMapIteratorOfRstMap ();
		%feature("compactdefaultargs") ChFiKPart_DataMapIteratorOfRstMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: ChFiKPart_RstMap &
	:rtype: None
") ChFiKPart_DataMapIteratorOfRstMap;
		 ChFiKPart_DataMapIteratorOfRstMap (const ChFiKPart_RstMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: ChFiKPart_RstMap &
	:rtype: None
") Initialize;
		void Initialize (const ChFiKPart_RstMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Value;
		Handle_Adaptor2d_HCurve2d Value ();
};


%extend ChFiKPart_DataMapIteratorOfRstMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiKPart_DataMapNodeOfRstMap;
class ChFiKPart_DataMapNodeOfRstMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ChFiKPart_DataMapNodeOfRstMap;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_Adaptor2d_HCurve2d &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ChFiKPart_DataMapNodeOfRstMap;
		 ChFiKPart_DataMapNodeOfRstMap (const Standard_Integer & K,const Handle_Adaptor2d_HCurve2d & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Value;
		Handle_Adaptor2d_HCurve2d Value ();
};


%extend ChFiKPart_DataMapNodeOfRstMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiKPart_DataMapNodeOfRstMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiKPart_DataMapNodeOfRstMap::Handle_ChFiKPart_DataMapNodeOfRstMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    ChFiKPart_DataMapNodeOfRstMap* _get_reference() {
    return (ChFiKPart_DataMapNodeOfRstMap*)$self->Access();
    }
};

%extend Handle_ChFiKPart_DataMapNodeOfRstMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiKPart_DataMapNodeOfRstMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiKPart_RstMap;
class ChFiKPart_RstMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") ChFiKPart_RstMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") ChFiKPart_RstMap;
		 ChFiKPart_RstMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiKPart_RstMap &
	:rtype: ChFiKPart_RstMap
") Assign;
		ChFiKPart_RstMap & Assign (const ChFiKPart_RstMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiKPart_RstMap &
	:rtype: ChFiKPart_RstMap
") operator =;
		ChFiKPart_RstMap & operator = (const ChFiKPart_RstMap & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Handle_Adaptor2d_HCurve2d & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_Adaptor2d_HCurve2d
") Find;
		Handle_Adaptor2d_HCurve2d Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_Adaptor2d_HCurve2d
") ChangeFind;
		Handle_Adaptor2d_HCurve2d ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend ChFiKPart_RstMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
