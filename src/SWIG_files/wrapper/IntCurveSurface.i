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
%module (package="OCC") IntCurveSurface

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


%include IntCurveSurface_headers.i


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
enum IntCurveSurface_TransitionOnCurve {
	IntCurveSurface_Tangent = 0,
	IntCurveSurface_In = 1,
	IntCurveSurface_Out = 2,
};

/* end public enums declaration */

%nodefaultctor IntCurveSurface_Intersection;
class IntCurveSurface_Intersection {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns the <done> field.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* returns the number of IntersectionPoint if IsDone returns True. else NotDone is raised.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* returns the IntersectionPoint of range <Index> raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbPoints>

	:param Index:
	:type Index: int
	:rtype: IntCurveSurface_IntersectionPoint
") Point;
		const IntCurveSurface_IntersectionPoint & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* returns the number of IntersectionSegment if IsDone returns True. else NotDone is raised.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* returns the IntersectionSegment of range <Index> raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbSegment>

	:param Index:
	:type Index: int
	:rtype: IntCurveSurface_IntersectionSegment
") Segment;
		const IntCurveSurface_IntersectionSegment & Segment (const Standard_Integer Index);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump all the fields.

	:rtype: None
") Dump;
		void Dump ();
};


%extend IntCurveSurface_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_IntersectionPoint;
class IntCurveSurface_IntersectionPoint {
	public:
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "	* Empty Constructor.

	:rtype: None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint ();
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "	* Create an IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float
	:param VSurf:
	:type VSurf: float
	:param UCurv:
	:type UCurv: float
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve
	:rtype: None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint (const gp_Pnt & P,const Standard_Real USurf,const Standard_Real VSurf,const Standard_Real UCurv,const IntCurveSurface_TransitionOnCurve TrCurv);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Set the fields of the current IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float
	:param VSurf:
	:type VSurf: float
	:param UCurv:
	:type UCurv: float
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve
	:rtype: None
") SetValues;
		void SetValues (const gp_Pnt & P,const Standard_Real USurf,const Standard_Real VSurf,const Standard_Real UCurv,const IntCurveSurface_TransitionOnCurve TrCurv);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Get the fields of the current IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float &
	:param VSurf:
	:type VSurf: float &
	:param UCurv:
	:type UCurv: float &
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve &
	:rtype: None
") Values;
		void Values (gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,IntCurveSurface_TransitionOnCurve & TrCurv);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* returns the geometric point.

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("compactdefaultargs") U;
		%feature("autodoc", "	* returns the U parameter on the surface.

	:rtype: float
") U;
		Standard_Real U ();
		%feature("compactdefaultargs") V;
		%feature("autodoc", "	* returns the V parameter on the surface.

	:rtype: float
") V;
		Standard_Real V ();
		%feature("compactdefaultargs") W;
		%feature("autodoc", "	* returns the parameter on the curve.

	:rtype: float
") W;
		Standard_Real W ();
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* returns the Transition of the point.

	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump all the fields.

	:rtype: None
") Dump;
		void Dump ();
};


%extend IntCurveSurface_IntersectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_IntersectionSegment;
class IntCurveSurface_IntersectionSegment {
	public:
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment ();
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment (const IntCurveSurface_IntersectionPoint & P1,const IntCurveSurface_IntersectionPoint & P2);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") SetValues;
		void SetValues (const IntCurveSurface_IntersectionPoint & P1,const IntCurveSurface_IntersectionPoint & P2);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") Values;
		void Values (IntCurveSurface_IntersectionPoint & P1,IntCurveSurface_IntersectionPoint & P2);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:rtype: None
") FirstPoint;
		void FirstPoint (IntCurveSurface_IntersectionPoint & P1);
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") SecondPoint;
		void SecondPoint (IntCurveSurface_IntersectionPoint & P2);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") FirstPoint;
		const IntCurveSurface_IntersectionPoint & FirstPoint ();
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") SecondPoint;
		const IntCurveSurface_IntersectionPoint & SecondPoint ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend IntCurveSurface_IntersectionSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_SequenceNodeOfSequenceOfPnt;
class IntCurveSurface_SequenceNodeOfSequenceOfPnt : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntCurveSurface_SequenceNodeOfSequenceOfPnt;
		%feature("autodoc", "	:param I:
	:type I: IntCurveSurface_IntersectionPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntCurveSurface_SequenceNodeOfSequenceOfPnt;
		 IntCurveSurface_SequenceNodeOfSequenceOfPnt (const IntCurveSurface_IntersectionPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") Value;
		IntCurveSurface_IntersectionPoint & Value ();
};


%extend IntCurveSurface_SequenceNodeOfSequenceOfPnt {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt::Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt;
class Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt();
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt(const Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt &aHandle);
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt(const IntCurveSurface_SequenceNodeOfSequenceOfPnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt {
    IntCurveSurface_SequenceNodeOfSequenceOfPnt* _get_reference() {
    return (IntCurveSurface_SequenceNodeOfSequenceOfPnt*)$self->Access();
    }
};

%extend Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntCurveSurface_SequenceNodeOfSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_SequenceNodeOfSequenceOfSeg;
class IntCurveSurface_SequenceNodeOfSequenceOfSeg : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntCurveSurface_SequenceNodeOfSequenceOfSeg;
		%feature("autodoc", "	:param I:
	:type I: IntCurveSurface_IntersectionSegment &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntCurveSurface_SequenceNodeOfSequenceOfSeg;
		 IntCurveSurface_SequenceNodeOfSequenceOfSeg (const IntCurveSurface_IntersectionSegment & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionSegment
") Value;
		IntCurveSurface_IntersectionSegment & Value ();
};


%extend IntCurveSurface_SequenceNodeOfSequenceOfSeg {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg::Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg;
class Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg();
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg(const Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg &aHandle);
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg(const IntCurveSurface_SequenceNodeOfSequenceOfSeg *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg {
    IntCurveSurface_SequenceNodeOfSequenceOfSeg* _get_reference() {
    return (IntCurveSurface_SequenceNodeOfSequenceOfSeg*)$self->Access();
    }
};

%extend Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntCurveSurface_SequenceNodeOfSequenceOfSeg {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_SequenceOfPnt;
class IntCurveSurface_SequenceOfPnt : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntCurveSurface_SequenceOfPnt;
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_SequenceOfPnt;
		 IntCurveSurface_SequenceOfPnt ();
		%feature("compactdefaultargs") IntCurveSurface_SequenceOfPnt;
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") IntCurveSurface_SequenceOfPnt;
		 IntCurveSurface_SequenceOfPnt (const IntCurveSurface_SequenceOfPnt & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfPnt &
	:rtype: IntCurveSurface_SequenceOfPnt
") Assign;
		const IntCurveSurface_SequenceOfPnt & Assign (const IntCurveSurface_SequenceOfPnt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfPnt &
	:rtype: IntCurveSurface_SequenceOfPnt
") operator =;
		const IntCurveSurface_SequenceOfPnt & operator = (const IntCurveSurface_SequenceOfPnt & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntCurveSurface_IntersectionPoint &
	:rtype: None
") Append;
		void Append (const IntCurveSurface_IntersectionPoint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") Append;
		void Append (IntCurveSurface_SequenceOfPnt & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntCurveSurface_IntersectionPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntCurveSurface_IntersectionPoint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") Prepend;
		void Prepend (IntCurveSurface_SequenceOfPnt & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntCurveSurface_IntersectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntCurveSurface_IntersectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") First;
		const IntCurveSurface_IntersectionPoint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") Last;
		const IntCurveSurface_IntersectionPoint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntCurveSurface_IntersectionPoint
") Value;
		const IntCurveSurface_IntersectionPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntCurveSurface_IntersectionPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntCurveSurface_IntersectionPoint
") ChangeValue;
		IntCurveSurface_IntersectionPoint & ChangeValue (const Standard_Integer Index);
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


%extend IntCurveSurface_SequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_SequenceOfSeg;
class IntCurveSurface_SequenceOfSeg : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntCurveSurface_SequenceOfSeg;
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_SequenceOfSeg;
		 IntCurveSurface_SequenceOfSeg ();
		%feature("compactdefaultargs") IntCurveSurface_SequenceOfSeg;
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") IntCurveSurface_SequenceOfSeg;
		 IntCurveSurface_SequenceOfSeg (const IntCurveSurface_SequenceOfSeg & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfSeg &
	:rtype: IntCurveSurface_SequenceOfSeg
") Assign;
		const IntCurveSurface_SequenceOfSeg & Assign (const IntCurveSurface_SequenceOfSeg & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfSeg &
	:rtype: IntCurveSurface_SequenceOfSeg
") operator =;
		const IntCurveSurface_SequenceOfSeg & operator = (const IntCurveSurface_SequenceOfSeg & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntCurveSurface_IntersectionSegment &
	:rtype: None
") Append;
		void Append (const IntCurveSurface_IntersectionSegment & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") Append;
		void Append (IntCurveSurface_SequenceOfSeg & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntCurveSurface_IntersectionSegment &
	:rtype: None
") Prepend;
		void Prepend (const IntCurveSurface_IntersectionSegment & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") Prepend;
		void Prepend (IntCurveSurface_SequenceOfSeg & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntCurveSurface_IntersectionSegment &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntCurveSurface_IntersectionSegment &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionSegment
") First;
		const IntCurveSurface_IntersectionSegment & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionSegment
") Last;
		const IntCurveSurface_IntersectionSegment & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntCurveSurface_IntersectionSegment
") Value;
		const IntCurveSurface_IntersectionSegment & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntCurveSurface_IntersectionSegment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntCurveSurface_IntersectionSegment
") ChangeValue;
		IntCurveSurface_IntersectionSegment & ChangeValue (const Standard_Integer Index);
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


%extend IntCurveSurface_SequenceOfSeg {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheCSFunctionOfHInter;
class IntCurveSurface_TheCSFunctionOfHInter : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") IntCurveSurface_TheCSFunctionOfHInter;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") IntCurveSurface_TheCSFunctionOfHInter;
		 IntCurveSurface_TheCSFunctionOfHInter (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") AuxillarSurface;
		Handle_Adaptor3d_HSurface AuxillarSurface ();
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") AuxillarCurve;
		Handle_Adaptor3d_HCurve AuxillarCurve ();
};


%extend IntCurveSurface_TheCSFunctionOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheExactHInter;
class IntCurveSurface_TheExactHInter {
	public:
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param F:
	:type F: IntCurveSurface_TheCSFunctionOfHInter &
	:param TolTangency:
	:type TolTangency: float
	:param MarginCoef: default value is 0.0
	:type MarginCoef: float
	:rtype: None
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter (const Standard_Real U,const Standard_Real V,const Standard_Real W,const IntCurveSurface_TheCSFunctionOfHInter & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "	:param F:
	:type F: IntCurveSurface_TheCSFunctionOfHInter &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter (const IntCurveSurface_TheCSFunctionOfHInter & F,const Standard_Real TolTangency);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:param u0:
	:type u0: float
	:param v0:
	:type v0: float
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param w0:
	:type w0: float
	:param w1:
	:type w1: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real U,const Standard_Real V,const Standard_Real W,math_FunctionSetRoot & Rsnld,const Standard_Real u0,const Standard_Real v0,const Standard_Real u1,const Standard_Real v1,const Standard_Real w0,const Standard_Real w1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "	:rtype: float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve ();
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParameterOnSurface;
		void ParameterOnSurface (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	:rtype: IntCurveSurface_TheCSFunctionOfHInter
") Function;
		IntCurveSurface_TheCSFunctionOfHInter & Function ();
};


%extend IntCurveSurface_TheExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntCurveSurface_TheHCurveTool {
	public:
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor3d_HCurve & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Handle_Adaptor3d_HCurve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") Period;
		static Standard_Real Period (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Handle_Adaptor3d_HCurve & C,const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
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
		static void D2 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
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
		static void D3 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor3d_HCurve & C,const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: Handle_Geom_BezierCurve
") Bezier;
		static Handle_Geom_BezierCurve Bezier (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Handle_Adaptor3d_HCurve & C,const Standard_Real U0,const Standard_Real U1);
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param Defl:
	:type Defl: float
	:param NbMin:
	:type NbMin: int
	:param Pars:
	:type Pars: Handle_TColStd_HArray1OfReal &
	:rtype: void
") SamplePars;
		static void SamplePars (const Handle_Adaptor3d_HCurve & C,const Standard_Real U0,const Standard_Real U1,const Standard_Real Defl,const Standard_Integer NbMin,Handle_TColStd_HArray1OfReal & Pars);
};


%extend IntCurveSurface_TheHCurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheInterferenceOfHInter;
class IntCurveSurface_TheInterferenceOfHInter : public Intf_Interference {
	public:
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter ();
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Interference;
		void Interference (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Interference;
		void Interference (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
};


%extend IntCurveSurface_TheInterferenceOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_ThePolygonOfHInter;
class IntCurveSurface_ThePolygonOfHInter {
	public:
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param NbPnt:
	:type NbPnt: int
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const Standard_Integer NbPnt);
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param NbPnt:
	:type NbPnt: int
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const Standard_Real U1,const Standard_Real U2,const Standard_Integer NbPnt);
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Upars:
	:type Upars: TColStd_Array1OfReal &
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const TColStd_Array1OfReal & Upars);
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	:rtype: Bnd_Box
") Bounding;
		const Bnd_Box & Bounding ();
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	:rtype: float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "	:param x:
	:type x: float
	:rtype: None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:param clos:
	:type clos: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") BeginOfSeg;
		const gp_Pnt  BeginOfSeg (const Standard_Integer Index);
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") EndOfSeg;
		const gp_Pnt  EndOfSeg (const Standard_Integer Index);
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "	:rtype: float
") InfParameter;
		Standard_Real InfParameter ();
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "	:rtype: float
") SupParameter;
		Standard_Real SupParameter ();
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend IntCurveSurface_ThePolygonOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntCurveSurface_ThePolygonToolOfHInter {
	public:
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: bool
") Closed;
		static Standard_Boolean Closed (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: int
") NbSegments;
		static Standard_Integer NbSegments (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") BeginOfSeg;
		static const gp_Pnt  BeginOfSeg (const IntCurveSurface_ThePolygonOfHInter & thePolygon,const Standard_Integer Index);
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") EndOfSeg;
		static const gp_Pnt  EndOfSeg (const IntCurveSurface_ThePolygonOfHInter & thePolygon,const Standard_Integer Index);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: void
") Dump;
		static void Dump (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
};


%extend IntCurveSurface_ThePolygonToolOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntCurveSurface_ThePolyhedronToolOfHInter {
	public:
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: Handle_Bnd_HArray1OfBox
") ComponentsBounding;
		Handle_Bnd_HArray1OfBox ComponentsBounding (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: int
") NbTriangles;
		static Standard_Integer NbTriangles (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index:
	:type Index: int
	:param P1:
	:type P1: int &
	:param P2:
	:type P2: int &
	:param P3:
	:type P3: int &
	:rtype: void
") Triangle;
		static void Triangle (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		static const gp_Pnt  Point (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index);
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Triang:
	:type Triang: int
	:param Pivot:
	:type Pivot: int
	:param Pedge:
	:type Pedge: int
	:param TriCon:
	:type TriCon: int &
	:param OtherP:
	:type OtherP: int &
	:rtype: int
") TriConnex;
		static Standard_Integer TriConnex (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Triang,const Standard_Integer Pivot,const Standard_Integer Pedge,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsOnBound;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index1:
	:type Index1: int
	:param Index2:
	:type Index2: int
	:rtype: bool
") IsOnBound;
		static Standard_Boolean IsOnBound (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: float
") GetBorderDeflection;
		static Standard_Real GetBorderDeflection (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: void
") Dump;
		static void Dump (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
};


%extend IntCurveSurface_ThePolyhedronToolOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheQuadCurvExactHInter;
class IntCurveSurface_TheQuadCurvExactHInter {
	public:
		%feature("compactdefaultargs") IntCurveSurface_TheQuadCurvExactHInter;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") IntCurveSurface_TheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvExactHInter (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Root;
		Standard_Real Root (const Standard_Integer Index);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Intervals;
		void Intervals (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend IntCurveSurface_TheQuadCurvExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
class IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		%feature("autodoc", "	:param Q:
	:type Q: IntSurf_Quadric &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter (const IntSurf_Quadric & Q,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_HInter;
class IntCurveSurface_HInter : public IntCurveSurface_Intersection {
	public:
		%feature("compactdefaultargs") IntCurveSurface_HInter;
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_HInter;
		 IntCurveSurface_HInter ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & Surface);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Polygon:
	:type Polygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & Polygon,const Handle_Adaptor3d_HSurface & Surface);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param ThePolygon:
	:type ThePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & ThePolygon,const Handle_Adaptor3d_HSurface & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param ThePolygon:
	:type ThePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:param BndBSB:
	:type BndBSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & ThePolygon,const Handle_Adaptor3d_HSurface & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron,Bnd_BoundSortBox & BndBSB);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);
};


%extend IntCurveSurface_HInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
