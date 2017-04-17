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
%module (package="OCC") AppParCurves

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


%include AppParCurves_headers.i


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
enum AppParCurves_Constraint {
	AppParCurves_NoConstraint = 0,
	AppParCurves_PassPoint = 1,
	AppParCurves_TangencyPoint = 2,
	AppParCurves_CurvaturePoint = 3,
};

/* end public enums declaration */

%rename(appparcurves) AppParCurves;
class AppParCurves {
	public:
		%feature("compactdefaultargs") BernsteinMatrix;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int
	:param U:
	:type U: math_Vector &
	:param A:
	:type A: math_Matrix &
	:rtype: void
") BernsteinMatrix;
		static void BernsteinMatrix (const Standard_Integer NbPoles,const math_Vector & U,math_Matrix & A);
		%feature("compactdefaultargs") Bernstein;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int
	:param U:
	:type U: math_Vector &
	:param A:
	:type A: math_Matrix &
	:param DA:
	:type DA: math_Matrix &
	:rtype: void
") Bernstein;
		static void Bernstein (const Standard_Integer NbPoles,const math_Vector & U,math_Matrix & A,math_Matrix & DA);
		%feature("compactdefaultargs") SecondDerivativeBernstein;
		%feature("autodoc", "	:param U:
	:type U: float
	:param DDA:
	:type DDA: math_Vector &
	:rtype: void
") SecondDerivativeBernstein;
		static void SecondDerivativeBernstein (const Standard_Real U,math_Vector & DDA);
		%feature("compactdefaultargs") SplineFunction;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int
	:param Degree:
	:type Degree: int
	:param Parameters:
	:type Parameters: math_Vector &
	:param FlatKnots:
	:type FlatKnots: math_Vector &
	:param A:
	:type A: math_Matrix &
	:param DA:
	:type DA: math_Matrix &
	:param Index:
	:type Index: math_IntegerVector &
	:rtype: void
") SplineFunction;
		static void SplineFunction (const Standard_Integer NbPoles,const Standard_Integer Degree,const math_Vector & Parameters,const math_Vector & FlatKnots,math_Matrix & A,math_Matrix & DA,math_IntegerVector & Index);
};


%extend AppParCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_Array1OfConstraintCouple;
class AppParCurves_Array1OfConstraintCouple {
	public:
		%feature("compactdefaultargs") AppParCurves_Array1OfConstraintCouple;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_Array1OfConstraintCouple;
		 AppParCurves_Array1OfConstraintCouple (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") AppParCurves_Array1OfConstraintCouple;
		%feature("autodoc", "	:param Item:
	:type Item: AppParCurves_ConstraintCouple &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_Array1OfConstraintCouple;
		 AppParCurves_Array1OfConstraintCouple (const AppParCurves_ConstraintCouple & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: AppParCurves_ConstraintCouple &
	:rtype: None
") Init;
		void Init (const AppParCurves_ConstraintCouple & V);
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
	:type Other: AppParCurves_Array1OfConstraintCouple &
	:rtype: AppParCurves_Array1OfConstraintCouple
") Assign;
		const AppParCurves_Array1OfConstraintCouple & Assign (const AppParCurves_Array1OfConstraintCouple & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_Array1OfConstraintCouple &
	:rtype: AppParCurves_Array1OfConstraintCouple
") operator =;
		const AppParCurves_Array1OfConstraintCouple & operator = (const AppParCurves_Array1OfConstraintCouple & Other);
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
	:type Value: AppParCurves_ConstraintCouple &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_ConstraintCouple & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_ConstraintCouple
") Value;
		const AppParCurves_ConstraintCouple & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_ConstraintCouple
") ChangeValue;
		AppParCurves_ConstraintCouple & ChangeValue (const Standard_Integer Index);
};


%extend AppParCurves_Array1OfConstraintCouple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_Array1OfMultiBSpCurve;
class AppParCurves_Array1OfMultiBSpCurve {
	public:
		%feature("compactdefaultargs") AppParCurves_Array1OfMultiBSpCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_Array1OfMultiBSpCurve;
		 AppParCurves_Array1OfMultiBSpCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") AppParCurves_Array1OfMultiBSpCurve;
		%feature("autodoc", "	:param Item:
	:type Item: AppParCurves_MultiBSpCurve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_Array1OfMultiBSpCurve;
		 AppParCurves_Array1OfMultiBSpCurve (const AppParCurves_MultiBSpCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: AppParCurves_MultiBSpCurve &
	:rtype: None
") Init;
		void Init (const AppParCurves_MultiBSpCurve & V);
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
	:type Other: AppParCurves_Array1OfMultiBSpCurve &
	:rtype: AppParCurves_Array1OfMultiBSpCurve
") Assign;
		const AppParCurves_Array1OfMultiBSpCurve & Assign (const AppParCurves_Array1OfMultiBSpCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_Array1OfMultiBSpCurve &
	:rtype: AppParCurves_Array1OfMultiBSpCurve
") operator =;
		const AppParCurves_Array1OfMultiBSpCurve & operator = (const AppParCurves_Array1OfMultiBSpCurve & Other);
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
	:type Value: AppParCurves_MultiBSpCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiBSpCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiBSpCurve
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue (const Standard_Integer Index);
};


%extend AppParCurves_Array1OfMultiBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_Array1OfMultiCurve;
class AppParCurves_Array1OfMultiCurve {
	public:
		%feature("compactdefaultargs") AppParCurves_Array1OfMultiCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_Array1OfMultiCurve;
		 AppParCurves_Array1OfMultiCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") AppParCurves_Array1OfMultiCurve;
		%feature("autodoc", "	:param Item:
	:type Item: AppParCurves_MultiCurve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_Array1OfMultiCurve;
		 AppParCurves_Array1OfMultiCurve (const AppParCurves_MultiCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: AppParCurves_MultiCurve &
	:rtype: None
") Init;
		void Init (const AppParCurves_MultiCurve & V);
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
	:type Other: AppParCurves_Array1OfMultiCurve &
	:rtype: AppParCurves_Array1OfMultiCurve
") Assign;
		const AppParCurves_Array1OfMultiCurve & Assign (const AppParCurves_Array1OfMultiCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_Array1OfMultiCurve &
	:rtype: AppParCurves_Array1OfMultiCurve
") operator =;
		const AppParCurves_Array1OfMultiCurve & operator = (const AppParCurves_Array1OfMultiCurve & Other);
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
	:type Value: AppParCurves_MultiCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue (const Standard_Integer Index);
};


%extend AppParCurves_Array1OfMultiCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_Array1OfMultiPoint;
class AppParCurves_Array1OfMultiPoint {
	public:
		%feature("compactdefaultargs") AppParCurves_Array1OfMultiPoint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_Array1OfMultiPoint;
		 AppParCurves_Array1OfMultiPoint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") AppParCurves_Array1OfMultiPoint;
		%feature("autodoc", "	:param Item:
	:type Item: AppParCurves_MultiPoint &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_Array1OfMultiPoint;
		 AppParCurves_Array1OfMultiPoint (const AppParCurves_MultiPoint & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: AppParCurves_MultiPoint &
	:rtype: None
") Init;
		void Init (const AppParCurves_MultiPoint & V);
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
	:type Other: AppParCurves_Array1OfMultiPoint &
	:rtype: AppParCurves_Array1OfMultiPoint
") Assign;
		const AppParCurves_Array1OfMultiPoint & Assign (const AppParCurves_Array1OfMultiPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_Array1OfMultiPoint &
	:rtype: AppParCurves_Array1OfMultiPoint
") operator =;
		const AppParCurves_Array1OfMultiPoint & operator = (const AppParCurves_Array1OfMultiPoint & Other);
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
	:type Value: AppParCurves_MultiPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiPoint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiPoint
") Value;
		const AppParCurves_MultiPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiPoint
") ChangeValue;
		AppParCurves_MultiPoint & ChangeValue (const Standard_Integer Index);
};


%extend AppParCurves_Array1OfMultiPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_ConstraintCouple;
class AppParCurves_ConstraintCouple {
	public:
		%feature("compactdefaultargs") AppParCurves_ConstraintCouple;
		%feature("autodoc", "	* returns an indefinite ConstraintCouple.

	:rtype: None
") AppParCurves_ConstraintCouple;
		 AppParCurves_ConstraintCouple ();
		%feature("compactdefaultargs") AppParCurves_ConstraintCouple;
		%feature("autodoc", "	* Create a couple the object <Index> will have the constraint <Cons>.

	:param TheIndex:
	:type TheIndex: int
	:param Cons:
	:type Cons: AppParCurves_Constraint
	:rtype: None
") AppParCurves_ConstraintCouple;
		 AppParCurves_ConstraintCouple (const Standard_Integer TheIndex,const AppParCurves_Constraint Cons);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* returns the index of the constraint object.

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") Constraint;
		%feature("autodoc", "	* returns the constraint of the object.

	:rtype: AppParCurves_Constraint
") Constraint;
		AppParCurves_Constraint Constraint ();
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Changes the index of the constraint object.

	:param TheIndex:
	:type TheIndex: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer TheIndex);
		%feature("compactdefaultargs") SetConstraint;
		%feature("autodoc", "	* Changes the constraint of the object.

	:param Cons:
	:type Cons: AppParCurves_Constraint
	:rtype: None
") SetConstraint;
		void SetConstraint (const AppParCurves_Constraint Cons);
};


%extend AppParCurves_ConstraintCouple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_HArray1OfConstraintCouple;
class AppParCurves_HArray1OfConstraintCouple : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") AppParCurves_HArray1OfConstraintCouple;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_HArray1OfConstraintCouple;
		 AppParCurves_HArray1OfConstraintCouple (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") AppParCurves_HArray1OfConstraintCouple;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: AppParCurves_ConstraintCouple &
	:rtype: None
") AppParCurves_HArray1OfConstraintCouple;
		 AppParCurves_HArray1OfConstraintCouple (const Standard_Integer Low,const Standard_Integer Up,const AppParCurves_ConstraintCouple & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: AppParCurves_ConstraintCouple &
	:rtype: None
") Init;
		void Init (const AppParCurves_ConstraintCouple & V);
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
	:type Value: AppParCurves_ConstraintCouple &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_ConstraintCouple & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_ConstraintCouple
") Value;
		const AppParCurves_ConstraintCouple & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_ConstraintCouple
") ChangeValue;
		AppParCurves_ConstraintCouple & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: AppParCurves_Array1OfConstraintCouple
") Array1;
		const AppParCurves_Array1OfConstraintCouple & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: AppParCurves_Array1OfConstraintCouple
") ChangeArray1;
		AppParCurves_Array1OfConstraintCouple & ChangeArray1 ();
};


%extend AppParCurves_HArray1OfConstraintCouple {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AppParCurves_HArray1OfConstraintCouple(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AppParCurves_HArray1OfConstraintCouple::Handle_AppParCurves_HArray1OfConstraintCouple %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AppParCurves_HArray1OfConstraintCouple;
class Handle_AppParCurves_HArray1OfConstraintCouple : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AppParCurves_HArray1OfConstraintCouple();
        Handle_AppParCurves_HArray1OfConstraintCouple(const Handle_AppParCurves_HArray1OfConstraintCouple &aHandle);
        Handle_AppParCurves_HArray1OfConstraintCouple(const AppParCurves_HArray1OfConstraintCouple *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AppParCurves_HArray1OfConstraintCouple DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AppParCurves_HArray1OfConstraintCouple {
    AppParCurves_HArray1OfConstraintCouple* _get_reference() {
    return (AppParCurves_HArray1OfConstraintCouple*)$self->Access();
    }
};

%extend Handle_AppParCurves_HArray1OfConstraintCouple {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AppParCurves_HArray1OfConstraintCouple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_HArray1OfMultiBSpCurve;
class AppParCurves_HArray1OfMultiBSpCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") AppParCurves_HArray1OfMultiBSpCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_HArray1OfMultiBSpCurve;
		 AppParCurves_HArray1OfMultiBSpCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") AppParCurves_HArray1OfMultiBSpCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: AppParCurves_MultiBSpCurve &
	:rtype: None
") AppParCurves_HArray1OfMultiBSpCurve;
		 AppParCurves_HArray1OfMultiBSpCurve (const Standard_Integer Low,const Standard_Integer Up,const AppParCurves_MultiBSpCurve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: AppParCurves_MultiBSpCurve &
	:rtype: None
") Init;
		void Init (const AppParCurves_MultiBSpCurve & V);
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
	:type Value: AppParCurves_MultiBSpCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiBSpCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiBSpCurve
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: AppParCurves_Array1OfMultiBSpCurve
") Array1;
		const AppParCurves_Array1OfMultiBSpCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: AppParCurves_Array1OfMultiBSpCurve
") ChangeArray1;
		AppParCurves_Array1OfMultiBSpCurve & ChangeArray1 ();
};


%extend AppParCurves_HArray1OfMultiBSpCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AppParCurves_HArray1OfMultiBSpCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AppParCurves_HArray1OfMultiBSpCurve::Handle_AppParCurves_HArray1OfMultiBSpCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AppParCurves_HArray1OfMultiBSpCurve;
class Handle_AppParCurves_HArray1OfMultiBSpCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AppParCurves_HArray1OfMultiBSpCurve();
        Handle_AppParCurves_HArray1OfMultiBSpCurve(const Handle_AppParCurves_HArray1OfMultiBSpCurve &aHandle);
        Handle_AppParCurves_HArray1OfMultiBSpCurve(const AppParCurves_HArray1OfMultiBSpCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AppParCurves_HArray1OfMultiBSpCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AppParCurves_HArray1OfMultiBSpCurve {
    AppParCurves_HArray1OfMultiBSpCurve* _get_reference() {
    return (AppParCurves_HArray1OfMultiBSpCurve*)$self->Access();
    }
};

%extend Handle_AppParCurves_HArray1OfMultiBSpCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AppParCurves_HArray1OfMultiBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_HArray1OfMultiCurve;
class AppParCurves_HArray1OfMultiCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") AppParCurves_HArray1OfMultiCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_HArray1OfMultiCurve;
		 AppParCurves_HArray1OfMultiCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") AppParCurves_HArray1OfMultiCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: AppParCurves_MultiCurve &
	:rtype: None
") AppParCurves_HArray1OfMultiCurve;
		 AppParCurves_HArray1OfMultiCurve (const Standard_Integer Low,const Standard_Integer Up,const AppParCurves_MultiCurve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: AppParCurves_MultiCurve &
	:rtype: None
") Init;
		void Init (const AppParCurves_MultiCurve & V);
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
	:type Value: AppParCurves_MultiCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: AppParCurves_Array1OfMultiCurve
") Array1;
		const AppParCurves_Array1OfMultiCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: AppParCurves_Array1OfMultiCurve
") ChangeArray1;
		AppParCurves_Array1OfMultiCurve & ChangeArray1 ();
};


%extend AppParCurves_HArray1OfMultiCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AppParCurves_HArray1OfMultiCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AppParCurves_HArray1OfMultiCurve::Handle_AppParCurves_HArray1OfMultiCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AppParCurves_HArray1OfMultiCurve;
class Handle_AppParCurves_HArray1OfMultiCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AppParCurves_HArray1OfMultiCurve();
        Handle_AppParCurves_HArray1OfMultiCurve(const Handle_AppParCurves_HArray1OfMultiCurve &aHandle);
        Handle_AppParCurves_HArray1OfMultiCurve(const AppParCurves_HArray1OfMultiCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AppParCurves_HArray1OfMultiCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AppParCurves_HArray1OfMultiCurve {
    AppParCurves_HArray1OfMultiCurve* _get_reference() {
    return (AppParCurves_HArray1OfMultiCurve*)$self->Access();
    }
};

%extend Handle_AppParCurves_HArray1OfMultiCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AppParCurves_HArray1OfMultiCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_HArray1OfMultiPoint;
class AppParCurves_HArray1OfMultiPoint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") AppParCurves_HArray1OfMultiPoint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") AppParCurves_HArray1OfMultiPoint;
		 AppParCurves_HArray1OfMultiPoint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") AppParCurves_HArray1OfMultiPoint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: AppParCurves_MultiPoint &
	:rtype: None
") AppParCurves_HArray1OfMultiPoint;
		 AppParCurves_HArray1OfMultiPoint (const Standard_Integer Low,const Standard_Integer Up,const AppParCurves_MultiPoint & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: AppParCurves_MultiPoint &
	:rtype: None
") Init;
		void Init (const AppParCurves_MultiPoint & V);
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
	:type Value: AppParCurves_MultiPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiPoint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiPoint
") Value;
		const AppParCurves_MultiPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiPoint
") ChangeValue;
		AppParCurves_MultiPoint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: AppParCurves_Array1OfMultiPoint
") Array1;
		const AppParCurves_Array1OfMultiPoint & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: AppParCurves_Array1OfMultiPoint
") ChangeArray1;
		AppParCurves_Array1OfMultiPoint & ChangeArray1 ();
};


%extend AppParCurves_HArray1OfMultiPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AppParCurves_HArray1OfMultiPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AppParCurves_HArray1OfMultiPoint::Handle_AppParCurves_HArray1OfMultiPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AppParCurves_HArray1OfMultiPoint;
class Handle_AppParCurves_HArray1OfMultiPoint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AppParCurves_HArray1OfMultiPoint();
        Handle_AppParCurves_HArray1OfMultiPoint(const Handle_AppParCurves_HArray1OfMultiPoint &aHandle);
        Handle_AppParCurves_HArray1OfMultiPoint(const AppParCurves_HArray1OfMultiPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AppParCurves_HArray1OfMultiPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AppParCurves_HArray1OfMultiPoint {
    AppParCurves_HArray1OfMultiPoint* _get_reference() {
    return (AppParCurves_HArray1OfMultiPoint*)$self->Access();
    }
};

%extend Handle_AppParCurves_HArray1OfMultiPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AppParCurves_HArray1OfMultiPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_MultiCurve;
class AppParCurves_MultiCurve {
	public:
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "	* returns an indefinite MultiCurve.

	:rtype: None
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve ();
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "	* creates a MultiCurve, describing Bezier curves all containing the same number of MultiPoint. An exception is raised if Degree < 0.

	:param NbPol:
	:type NbPol: int
	:rtype: None
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve (const Standard_Integer NbPol);
		%feature("compactdefaultargs") AppParCurves_MultiCurve;
		%feature("autodoc", "	* creates a MultiCurve, describing Bezier curves all containing the same number of MultiPoint. Each MultiPoint must have NbCurves Poles.

	:param tabMU:
	:type tabMU: AppParCurves_Array1OfMultiPoint &
	:rtype: None
") AppParCurves_MultiCurve;
		 AppParCurves_MultiCurve (const AppParCurves_Array1OfMultiPoint & tabMU);
		%feature("compactdefaultargs") SetNbPoles;
		%feature("autodoc", "	* The number of poles of the MultiCurve will be set to <nbPoles>.

	:param nbPoles:
	:type nbPoles: int
	:rtype: None
") SetNbPoles;
		void SetNbPoles (const Standard_Integer nbPoles);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* sets the MultiPoint of range Index to the value <MPoint>. An exception is raised if Index <0 or Index >NbMPoint.

	:param Index:
	:type Index: int
	:param MPoint:
	:type MPoint: AppParCurves_MultiPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiPoint & MPoint);
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "	* Returns the number of curves resulting from the approximation of a MultiLine.

	:rtype: int
") NbCurves;
		Standard_Integer NbCurves ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	* Returns the number of poles on curves resulting from the approximation of a MultiLine.

	:rtype: int
") NbPoles;
		virtual Standard_Integer NbPoles ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	* returns the degree of the curves.

	:rtype: int
") Degree;
		virtual Standard_Integer Degree ();
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "	* returns the dimension of the CuIndex curve. An exception is raised if CuIndex<0 or CuIndex>NbCurves.

	:param CuIndex:
	:type CuIndex: int
	:rtype: int
") Dimension;
		Standard_Integer Dimension (const Standard_Integer CuIndex);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* returns the Pole array of the curve of range CuIndex. An exception is raised if the dimension of the curve is 2d.

	:param CuIndex:
	:type CuIndex: int
	:param TabPnt:
	:type TabPnt: TColgp_Array1OfPnt
	:rtype: None
") Curve;
		void Curve (const Standard_Integer CuIndex,TColgp_Array1OfPnt & TabPnt);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* returns the Pole array of the curve of range CuIndex. An exception is raised if the dimension of the curve is 3d.

	:param CuIndex:
	:type CuIndex: int
	:param TabPnt:
	:type TabPnt: TColgp_Array1OfPnt2d
	:rtype: None
") Curve;
		void Curve (const Standard_Integer CuIndex,TColgp_Array1OfPnt2d & TabPnt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the Index MultiPoint. An exception is raised if Index <0 or Index >Degree+1.

	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiPoint
") Value;
		const AppParCurves_MultiPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "	* returns the Nieme pole of the CuIndex curve. the curve must be a 3D curve.

	:param CuIndex:
	:type CuIndex: int
	:param Nieme:
	:type Nieme: int
	:rtype: gp_Pnt
") Pole;
		const gp_Pnt  Pole (const Standard_Integer CuIndex,const Standard_Integer Nieme);
		%feature("compactdefaultargs") Pole2d;
		%feature("autodoc", "	* returns the Nieme pole of the CuIndex curve. the curve must be a 2D curve.

	:param CuIndex:
	:type CuIndex: int
	:param Nieme:
	:type Nieme: int
	:rtype: gp_Pnt2d
") Pole2d;
		const gp_Pnt2d  Pole2d (const Standard_Integer CuIndex,const Standard_Integer Nieme);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Applies a transformation to the curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz

	:param CuIndex:
	:type CuIndex: int
	:param x:
	:type x: float
	:param dx:
	:type dx: float
	:param y:
	:type y: float
	:param dy:
	:type dy: float
	:param z:
	:type z: float
	:param dz:
	:type dz: float
	:rtype: None
") Transform;
		void Transform (const Standard_Integer CuIndex,const Standard_Real x,const Standard_Real dx,const Standard_Real y,const Standard_Real dy,const Standard_Real z,const Standard_Real dz);
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "	* Applies a transformation to the Curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.

	:param CuIndex:
	:type CuIndex: int
	:param x:
	:type x: float
	:param dx:
	:type dx: float
	:param y:
	:type y: float
	:param dy:
	:type dy: float
	:rtype: None
") Transform2d;
		void Transform2d (const Standard_Integer CuIndex,const Standard_Real x,const Standard_Real dx,const Standard_Real y,const Standard_Real dy);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:rtype: void
") Value;
		virtual void Value (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:rtype: void
") Value;
		virtual void Value (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		virtual void D1 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt,gp_Vec & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		virtual void D1 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt,gp_Vec2d & V1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		virtual void D2 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the Bezier curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		virtual void D2 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt,gp_Vec2d & V1,gp_Vec2d & V2);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend AppParCurves_MultiCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_MultiPoint;
class AppParCurves_MultiPoint {
	public:
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "	* creates an indefinite MultiPoint.

	:rtype: None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint ();
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "	* constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d. NbPoints is the number of 3D Points. NbPoints2d is the number of 2D Points.

	:param NbPoints:
	:type NbPoints: int
	:param NbPoints2d:
	:type NbPoints2d: int
	:rtype: None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint (const Standard_Integer NbPoints,const Standard_Integer NbPoints2d);
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "	* creates a MultiPoint only composed of 3D points.

	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:rtype: None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint (const TColgp_Array1OfPnt & tabP);
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "	* creates a MultiPoint only composed of 2D points.

	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:rtype: None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint (const TColgp_Array1OfPnt2d & tabP2d);
		%feature("compactdefaultargs") AppParCurves_MultiPoint;
		%feature("autodoc", "	* constructs a set of Points used to approximate a Multiline. These Points can be of 2 or 3 dimensions. Points will be initialized with SetPoint and SetPoint2d. NbPoints is the total number of Points.

	:param tabP:
	:type tabP: TColgp_Array1OfPnt
	:param tabP2d:
	:type tabP2d: TColgp_Array1OfPnt2d
	:rtype: None
") AppParCurves_MultiPoint;
		 AppParCurves_MultiPoint (const TColgp_Array1OfPnt & tabP,const TColgp_Array1OfPnt2d & tabP2d);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* the 3d Point of range Index of this MultiPoint is set to <Point>. An exception is raised if Index < 0 or Index > number of 3d Points.

	:param Index:
	:type Index: int
	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const Standard_Integer Index,const gp_Pnt & Point);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* returns the 3d Point of range Index. An exception is raised if Index < 0 or Index < number of 3d Points.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point (const Standard_Integer Index);
		%feature("compactdefaultargs") SetPoint2d;
		%feature("autodoc", "	* The 2d Point of range Index is set to <Point>. An exception is raised if Index > 3d Points or Index > total number of Points.

	:param Index:
	:type Index: int
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None
") SetPoint2d;
		void SetPoint2d (const Standard_Integer Index,const gp_Pnt2d & Point);
		%feature("compactdefaultargs") Point2d;
		%feature("autodoc", "	* returns the 2d Point of range Index. An exception is raised if index <= number of 3d Points or Index > total number of Points.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Point2d;
		const gp_Pnt2d  Point2d (const Standard_Integer Index);
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "	* returns the dimension of the point of range Index. An exception is raised if Index <0 or Index > NbCurves.

	:param Index:
	:type Index: int
	:rtype: int
") Dimension;
		Standard_Integer Dimension (const Standard_Integer Index);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* returns the number of points of dimension 3D.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") NbPoints2d;
		%feature("autodoc", "	* returns the number of points of dimension 2D.

	:rtype: int
") NbPoints2d;
		Standard_Integer NbPoints2d ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Applies a transformation to the curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve. newz = z + dz*oldz

	:param CuIndex:
	:type CuIndex: int
	:param x:
	:type x: float
	:param dx:
	:type dx: float
	:param y:
	:type y: float
	:param dy:
	:type dy: float
	:param z:
	:type z: float
	:param dz:
	:type dz: float
	:rtype: None
") Transform;
		void Transform (const Standard_Integer CuIndex,const Standard_Real x,const Standard_Real dx,const Standard_Real y,const Standard_Real dy,const Standard_Real z,const Standard_Real dz);
		%feature("compactdefaultargs") Transform2d;
		%feature("autodoc", "	* Applies a transformation to the Curve of range <CuIndex>. newx = x + dx*oldx newy = y + dy*oldy for all points of the curve.

	:param CuIndex:
	:type CuIndex: int
	:param x:
	:type x: float
	:param dx:
	:type dx: float
	:param y:
	:type y: float
	:param dy:
	:type dy: float
	:rtype: None
") Transform2d;
		void Transform2d (const Standard_Integer CuIndex,const Standard_Real x,const Standard_Real dx,const Standard_Real y,const Standard_Real dy);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend AppParCurves_MultiPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve;
class AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve;
		%feature("autodoc", "	:param I:
	:type I: AppParCurves_MultiBSpCurve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve;
		 AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve (const AppParCurves_MultiBSpCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") Value;
		AppParCurves_MultiBSpCurve & Value ();
};


%extend AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve::Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve;
class Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve();
        Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve(const Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve &aHandle);
        Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve(const AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve {
    AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve* _get_reference() {
    return (AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve*)$self->Access();
    }
};

%extend Handle_AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_SequenceNodeOfSequenceOfMultiCurve;
class AppParCurves_SequenceNodeOfSequenceOfMultiCurve : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") AppParCurves_SequenceNodeOfSequenceOfMultiCurve;
		%feature("autodoc", "	:param I:
	:type I: AppParCurves_MultiCurve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") AppParCurves_SequenceNodeOfSequenceOfMultiCurve;
		 AppParCurves_SequenceNodeOfSequenceOfMultiCurve (const AppParCurves_MultiCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve & Value ();
};


%extend AppParCurves_SequenceNodeOfSequenceOfMultiCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve::Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve;
class Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve();
        Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve(const Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve &aHandle);
        Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve(const AppParCurves_SequenceNodeOfSequenceOfMultiCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve {
    AppParCurves_SequenceNodeOfSequenceOfMultiCurve* _get_reference() {
    return (AppParCurves_SequenceNodeOfSequenceOfMultiCurve*)$self->Access();
    }
};

%extend Handle_AppParCurves_SequenceNodeOfSequenceOfMultiCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AppParCurves_SequenceNodeOfSequenceOfMultiCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_SequenceOfMultiBSpCurve;
class AppParCurves_SequenceOfMultiBSpCurve : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") AppParCurves_SequenceOfMultiBSpCurve;
		%feature("autodoc", "	:rtype: None
") AppParCurves_SequenceOfMultiBSpCurve;
		 AppParCurves_SequenceOfMultiBSpCurve ();
		%feature("compactdefaultargs") AppParCurves_SequenceOfMultiBSpCurve;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_SequenceOfMultiBSpCurve &
	:rtype: None
") AppParCurves_SequenceOfMultiBSpCurve;
		 AppParCurves_SequenceOfMultiBSpCurve (const AppParCurves_SequenceOfMultiBSpCurve & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_SequenceOfMultiBSpCurve &
	:rtype: AppParCurves_SequenceOfMultiBSpCurve
") Assign;
		const AppParCurves_SequenceOfMultiBSpCurve & Assign (const AppParCurves_SequenceOfMultiBSpCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_SequenceOfMultiBSpCurve &
	:rtype: AppParCurves_SequenceOfMultiBSpCurve
") operator =;
		const AppParCurves_SequenceOfMultiBSpCurve & operator = (const AppParCurves_SequenceOfMultiBSpCurve & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: AppParCurves_MultiBSpCurve &
	:rtype: None
") Append;
		void Append (const AppParCurves_MultiBSpCurve & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: AppParCurves_SequenceOfMultiBSpCurve &
	:rtype: None
") Append;
		void Append (AppParCurves_SequenceOfMultiBSpCurve & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: AppParCurves_MultiBSpCurve &
	:rtype: None
") Prepend;
		void Prepend (const AppParCurves_MultiBSpCurve & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: AppParCurves_SequenceOfMultiBSpCurve &
	:rtype: None
") Prepend;
		void Prepend (AppParCurves_SequenceOfMultiBSpCurve & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AppParCurves_MultiBSpCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AppParCurves_MultiBSpCurve & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AppParCurves_SequenceOfMultiBSpCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AppParCurves_SequenceOfMultiBSpCurve & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AppParCurves_MultiBSpCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AppParCurves_MultiBSpCurve & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AppParCurves_SequenceOfMultiBSpCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AppParCurves_SequenceOfMultiBSpCurve & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") First;
		const AppParCurves_MultiBSpCurve & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") Last;
		const AppParCurves_MultiBSpCurve & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: AppParCurves_SequenceOfMultiBSpCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,AppParCurves_SequenceOfMultiBSpCurve & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: AppParCurves_MultiBSpCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiBSpCurve & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiBSpCurve
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue (const Standard_Integer Index);
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


%extend AppParCurves_SequenceOfMultiBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_SequenceOfMultiCurve;
class AppParCurves_SequenceOfMultiCurve : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") AppParCurves_SequenceOfMultiCurve;
		%feature("autodoc", "	:rtype: None
") AppParCurves_SequenceOfMultiCurve;
		 AppParCurves_SequenceOfMultiCurve ();
		%feature("compactdefaultargs") AppParCurves_SequenceOfMultiCurve;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_SequenceOfMultiCurve &
	:rtype: None
") AppParCurves_SequenceOfMultiCurve;
		 AppParCurves_SequenceOfMultiCurve (const AppParCurves_SequenceOfMultiCurve & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_SequenceOfMultiCurve &
	:rtype: AppParCurves_SequenceOfMultiCurve
") Assign;
		const AppParCurves_SequenceOfMultiCurve & Assign (const AppParCurves_SequenceOfMultiCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AppParCurves_SequenceOfMultiCurve &
	:rtype: AppParCurves_SequenceOfMultiCurve
") operator =;
		const AppParCurves_SequenceOfMultiCurve & operator = (const AppParCurves_SequenceOfMultiCurve & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: AppParCurves_MultiCurve &
	:rtype: None
") Append;
		void Append (const AppParCurves_MultiCurve & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: AppParCurves_SequenceOfMultiCurve &
	:rtype: None
") Append;
		void Append (AppParCurves_SequenceOfMultiCurve & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: AppParCurves_MultiCurve &
	:rtype: None
") Prepend;
		void Prepend (const AppParCurves_MultiCurve & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: AppParCurves_SequenceOfMultiCurve &
	:rtype: None
") Prepend;
		void Prepend (AppParCurves_SequenceOfMultiCurve & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AppParCurves_MultiCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AppParCurves_MultiCurve & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AppParCurves_SequenceOfMultiCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AppParCurves_SequenceOfMultiCurve & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AppParCurves_MultiCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AppParCurves_MultiCurve & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AppParCurves_SequenceOfMultiCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AppParCurves_SequenceOfMultiCurve & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") First;
		const AppParCurves_MultiCurve & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Last;
		const AppParCurves_MultiCurve & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: AppParCurves_SequenceOfMultiCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,AppParCurves_SequenceOfMultiCurve & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: AppParCurves_MultiCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AppParCurves_MultiCurve & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue (const Standard_Integer Index);
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


%extend AppParCurves_SequenceOfMultiCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppParCurves_MultiBSpCurve;
class AppParCurves_MultiBSpCurve : public AppParCurves_MultiCurve {
	public:
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "	* returns an indefinite MultiBSpCurve.

	:rtype: None
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve ();
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "	* creates a MultiBSpCurve, describing BSpline curves all containing the same number of MultiPoint. An exception is raised if Degree < 0.

	:param NbPol:
	:type NbPol: int
	:rtype: None
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve (const Standard_Integer NbPol);
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "	* creates a MultiBSpCurve, describing BSpline curves all containing the same number of MultiPoint. Each MultiPoint must have NbCurves Poles.

	:param tabMU:
	:type tabMU: AppParCurves_Array1OfMultiPoint &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve (const AppParCurves_Array1OfMultiPoint & tabMU,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);
		%feature("compactdefaultargs") AppParCurves_MultiBSpCurve;
		%feature("autodoc", "	* creates a MultiBSpCurve, describing BSpline curves, taking control points from <SC>.

	:param SC:
	:type SC: AppParCurves_MultiCurve &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") AppParCurves_MultiBSpCurve;
		 AppParCurves_MultiBSpCurve (const AppParCurves_MultiCurve & SC,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "	* Knots of the multiBSpCurve are assigned to <theknots>.

	:param theKnots:
	:type theKnots: TColStd_Array1OfReal &
	:rtype: None
") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & theKnots);
		%feature("compactdefaultargs") SetMultiplicities;
		%feature("autodoc", "	* Multiplicities of the multiBSpCurve are assigned to <theMults>.

	:param theMults:
	:type theMults: TColStd_Array1OfInteger &
	:rtype: None
") SetMultiplicities;
		void SetMultiplicities (const TColStd_Array1OfInteger & theMults);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* Returns an array of Reals containing the multiplicities of curves resulting from the approximation.

	:rtype: TColStd_Array1OfReal
") Knots;
		const TColStd_Array1OfReal & Knots ();
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "	* Returns an array of Reals containing the multiplicities of curves resulting from the approximation.

	:rtype: TColStd_Array1OfInteger
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	* returns the degree of the curve(s).

	:rtype: int
") Degree;
		virtual Standard_Integer Degree ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:rtype: void
") Value;
		virtual void Value (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:rtype: void
") Value;
		virtual void Value (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		virtual void D1 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt,gp_Vec & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		virtual void D1 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt,gp_Vec2d & V1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 3d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		virtual void D2 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt & Pt,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* returns the value of the point with a parameter U on the BSpline curve number CuIndex. An exception is raised if CuIndex <0 or > NbCurves. An exception is raised if the curve dimension is 2d.

	:param CuIndex:
	:type CuIndex: int
	:param U:
	:type U: float
	:param Pt:
	:type Pt: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		virtual void D2 (const Standard_Integer CuIndex,const Standard_Real U,gp_Pnt2d & Pt,gp_Vec2d & V1,gp_Vec2d & V2);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend AppParCurves_MultiBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
