/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define BNDDOCSTRING
"Bnd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bnd.html"
%enddef
%module (package="OCC.Core", docstring=BNDDOCSTRING) Bnd


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


%{
#include<Bnd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<BVH_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TColStd.i
%import TColgp.i
%import BVH.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Bnd_HArray1OfBox)
%wrap_handle(Bnd_HArray1OfSphere)
%wrap_handle(Bnd_HArray1OfBox2d)
/* end handles declaration */

/* templates */
%template(Bnd_Array1OfBox) NCollection_Array1<Bnd_Box>;

%extend NCollection_Array1<Bnd_Box> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Bnd_Array1OfBox2d) NCollection_Array1<Bnd_Box2d>;

%extend NCollection_Array1<Bnd_Box2d> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Bnd_Array1OfSphere) NCollection_Array1<Bnd_Sphere>;

%extend NCollection_Array1<Bnd_Sphere> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Bnd_SeqOfBox) NCollection_Sequence<Bnd_Box>;

%extend NCollection_Sequence<Bnd_Box> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Bnd_Box> Bnd_Array1OfBox;
typedef NCollection_Array1<Bnd_Box2d> Bnd_Array1OfBox2d;
typedef NCollection_Array1<Bnd_Sphere> Bnd_Array1OfSphere;
typedef NCollection_Sequence<Bnd_Box> Bnd_SeqOfBox;
/* end typedefs declaration */

/****************
* class Bnd_B2d *
****************/
class Bnd_B2d {
	public:
		/****************** Bnd_B2d ******************/
		%feature("compactdefaultargs") Bnd_B2d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_B2d;
		 Bnd_B2d();

		/****************** Bnd_B2d ******************/
		%feature("compactdefaultargs") Bnd_B2d;
		%feature("autodoc", "Constructor.

Parameters
----------
theCenter: gp_XY
theHSize: gp_XY

Returns
-------
None
") Bnd_B2d;
		 Bnd_B2d(const gp_XY & theCenter, const gp_XY & theHSize);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by a point.

Parameters
----------
thePnt: gp_XY

Returns
-------
None
") Add;
		void Add(const gp_XY & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by a point.

Parameters
----------
thePnt: gp_Pnt2d

Returns
-------
None
") Add;
		void Add(const gp_Pnt2d & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by another box.

Parameters
----------
theBox: Bnd_B2d

Returns
-------
None
") Add;
		void Add(const Bnd_B2d & theBox);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset the box data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Query a box corner: (center + hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XY
") CornerMax;
		gp_XY CornerMax();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Query a box corner: (center - hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XY
") CornerMin;
		gp_XY CornerMin();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "Extend the box by the absolute value of thediff.

Parameters
----------
theDiff: float

Returns
-------
None
") Enlarge;
		void Enlarge(const Standard_Real theDiff);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Check that the box 'this' is inside the given box 'thebox'. returns true if 'this' box is fully inside 'thebox'.

Parameters
----------
theBox: Bnd_B2d

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const Bnd_B2d & theBox);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Check that the box 'this' is inside the given box 'thebox' transformed by 'thetrsf'. returns true if 'this' box is fully inside the transformed 'thebox'.

Parameters
----------
theBox: Bnd_B2d
theTrsf: gp_Trsf2d

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const Bnd_B2d & theBox, const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given point for the inclusion in the box. returns true if the point is outside.

Parameters
----------
thePnt: gp_XY

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XY & thePnt);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check a circle for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theCenter: gp_XY
theRadius: float
isCircleHollow: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XY & theCenter, const Standard_Real theRadius, const Standard_Boolean isCircleHollow = Standard_False);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given box for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theOtherBox: Bnd_B2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_B2d & theOtherBox);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given box oriented by the given transformation for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theOtherBox: Bnd_B2d
theTrsf: gp_Trsf2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_B2d & theOtherBox, const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given line for the intersection with the current box. returns true if there is no intersection.

Parameters
----------
theLine: gp_Ax2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Ax2d & theLine);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the segment defined by the couple of input points for the intersection with the current box. returns true if there is no intersection.

Parameters
----------
theP0: gp_XY
theP1: gp_XY

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XY & theP0, const gp_XY & theP1);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if the box is void (non-initialized).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Limit the box by the internals of theotherbox. returns true if the limitation takes place, otherwise false indicating that the boxes do not intersect.

Parameters
----------
theOtherBox: Bnd_B2d

Returns
-------
bool
") Limit;
		Standard_Boolean Limit(const Bnd_B2d & theOtherBox);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "Set the center coordinates.

Parameters
----------
theCenter: gp_XY

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_XY & theCenter);

		/****************** SetHSize ******************/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "Set the hsize (half-diagonal) coordinates. all components of thehsize must be non-negative.

Parameters
----------
theHSize: gp_XY

Returns
-------
None
") SetHSize;
		void SetHSize(const gp_XY & theHSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Query the square diagonal. if the box is void (see method isvoid()) then a very big real value is returned.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transform the bounding box with the given transformation. the resulting box will be larger if thetrsf contains rotation.

Parameters
----------
theTrsf: gp_Trsf2d

Returns
-------
Bnd_B2d
") Transformed;
		Bnd_B2d Transformed(const gp_Trsf2d & theTrsf);

};


%extend Bnd_B2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class Bnd_B2f *
****************/
class Bnd_B2f {
	public:
		/****************** Bnd_B2f ******************/
		%feature("compactdefaultargs") Bnd_B2f;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_B2f;
		 Bnd_B2f();

		/****************** Bnd_B2f ******************/
		%feature("compactdefaultargs") Bnd_B2f;
		%feature("autodoc", "Constructor.

Parameters
----------
theCenter: gp_XY
theHSize: gp_XY

Returns
-------
None
") Bnd_B2f;
		 Bnd_B2f(const gp_XY & theCenter, const gp_XY & theHSize);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by a point.

Parameters
----------
thePnt: gp_XY

Returns
-------
None
") Add;
		void Add(const gp_XY & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by a point.

Parameters
----------
thePnt: gp_Pnt2d

Returns
-------
None
") Add;
		void Add(const gp_Pnt2d & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by another box.

Parameters
----------
theBox: Bnd_B2f

Returns
-------
None
") Add;
		void Add(const Bnd_B2f & theBox);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset the box data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Query a box corner: (center + hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XY
") CornerMax;
		gp_XY CornerMax();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Query a box corner: (center - hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XY
") CornerMin;
		gp_XY CornerMin();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "Extend the box by the absolute value of thediff.

Parameters
----------
theDiff: float

Returns
-------
None
") Enlarge;
		void Enlarge(const Standard_Real theDiff);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Check that the box 'this' is inside the given box 'thebox'. returns true if 'this' box is fully inside 'thebox'.

Parameters
----------
theBox: Bnd_B2f

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const Bnd_B2f & theBox);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Check that the box 'this' is inside the given box 'thebox' transformed by 'thetrsf'. returns true if 'this' box is fully inside the transformed 'thebox'.

Parameters
----------
theBox: Bnd_B2f
theTrsf: gp_Trsf2d

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const Bnd_B2f & theBox, const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given point for the inclusion in the box. returns true if the point is outside.

Parameters
----------
thePnt: gp_XY

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XY & thePnt);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check a circle for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theCenter: gp_XY
theRadius: float
isCircleHollow: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XY & theCenter, const Standard_Real theRadius, const Standard_Boolean isCircleHollow = Standard_False);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given box for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theOtherBox: Bnd_B2f

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_B2f & theOtherBox);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given box oriented by the given transformation for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theOtherBox: Bnd_B2f
theTrsf: gp_Trsf2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_B2f & theOtherBox, const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given line for the intersection with the current box. returns true if there is no intersection.

Parameters
----------
theLine: gp_Ax2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Ax2d & theLine);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the segment defined by the couple of input points for the intersection with the current box. returns true if there is no intersection.

Parameters
----------
theP0: gp_XY
theP1: gp_XY

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XY & theP0, const gp_XY & theP1);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if the box is void (non-initialized).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Limit the box by the internals of theotherbox. returns true if the limitation takes place, otherwise false indicating that the boxes do not intersect.

Parameters
----------
theOtherBox: Bnd_B2f

Returns
-------
bool
") Limit;
		Standard_Boolean Limit(const Bnd_B2f & theOtherBox);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "Set the center coordinates.

Parameters
----------
theCenter: gp_XY

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_XY & theCenter);

		/****************** SetHSize ******************/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "Set the hsize (half-diagonal) coordinates. all components of thehsize must be non-negative.

Parameters
----------
theHSize: gp_XY

Returns
-------
None
") SetHSize;
		void SetHSize(const gp_XY & theHSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Query the square diagonal. if the box is void (see method isvoid()) then a very big real value is returned.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transform the bounding box with the given transformation. the resulting box will be larger if thetrsf contains rotation.

Parameters
----------
theTrsf: gp_Trsf2d

Returns
-------
Bnd_B2f
") Transformed;
		Bnd_B2f Transformed(const gp_Trsf2d & theTrsf);

};


%extend Bnd_B2f {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class Bnd_B3d *
****************/
class Bnd_B3d {
	public:
		/****************** Bnd_B3d ******************/
		%feature("compactdefaultargs") Bnd_B3d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_B3d;
		 Bnd_B3d();

		/****************** Bnd_B3d ******************/
		%feature("compactdefaultargs") Bnd_B3d;
		%feature("autodoc", "Constructor.

Parameters
----------
theCenter: gp_XYZ
theHSize: gp_XYZ

Returns
-------
None
") Bnd_B3d;
		 Bnd_B3d(const gp_XYZ & theCenter, const gp_XYZ & theHSize);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by a point.

Parameters
----------
thePnt: gp_XYZ

Returns
-------
None
") Add;
		void Add(const gp_XYZ & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by a point.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") Add;
		void Add(const gp_Pnt & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by another box.

Parameters
----------
theBox: Bnd_B3d

Returns
-------
None
") Add;
		void Add(const Bnd_B3d & theBox);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset the box data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Query the upper corner: (center + hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XYZ
") CornerMax;
		gp_XYZ CornerMax();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Query the lower corner: (center - hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XYZ
") CornerMin;
		gp_XYZ CornerMin();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "Extend the box by the absolute value of thediff.

Parameters
----------
theDiff: float

Returns
-------
None
") Enlarge;
		void Enlarge(const Standard_Real theDiff);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Check that the box 'this' is inside the given box 'thebox'. returns true if 'this' box is fully inside 'thebox'.

Parameters
----------
theBox: Bnd_B3d

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const Bnd_B3d & theBox);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Check that the box 'this' is inside the given box 'thebox' transformed by 'thetrsf'. returns true if 'this' box is fully inside the transformed 'thebox'.

Parameters
----------
theBox: Bnd_B3d
theTrsf: gp_Trsf

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const Bnd_B3d & theBox, const gp_Trsf & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given point for the inclusion in the box. returns true if the point is outside.

Parameters
----------
thePnt: gp_XYZ

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & thePnt);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check a sphere for the intersection with the current box. returns true if there is no intersection between boxes. if the parameter 'isspherehollow' is true, then the intersection is not reported for a box that is completely inside the sphere (otherwise this method would report an intersection).

Parameters
----------
theCenter: gp_XYZ
theRadius: float
isSphereHollow: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & theCenter, const Standard_Real theRadius, const Standard_Boolean isSphereHollow = Standard_False);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given box for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theOtherBox: Bnd_B3d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_B3d & theOtherBox);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given box oriented by the given transformation for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theOtherBox: Bnd_B3d
theTrsf: gp_Trsf

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_B3d & theOtherBox, const gp_Trsf & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given line for the intersection with the current box. returns true if there is no intersection. isray==true means intersection check with the positive half-line theoverthickness is the addition to the size of the current box (may be negative). if positive, it can be treated as the thickness of the line 'theline' or the radius of the cylinder along 'theline'.

Parameters
----------
theLine: gp_Ax1
isRay: bool,optional
	default value is Standard_False
theOverthickness: float,optional
	default value is 0.0

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Ax1 & theLine, const Standard_Boolean isRay = Standard_False, const Standard_Real theOverthickness = 0.0);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given plane for the intersection with the current box. returns true if there is no intersection.

Parameters
----------
thePlane: gp_Ax3

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Ax3 & thePlane);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if the box is void (non-initialized).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Limit the box by the internals of theotherbox. returns true if the limitation takes place, otherwise false indicating that the boxes do not intersect.

Parameters
----------
theOtherBox: Bnd_B3d

Returns
-------
bool
") Limit;
		Standard_Boolean Limit(const Bnd_B3d & theOtherBox);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "Set the center coordinates.

Parameters
----------
theCenter: gp_XYZ

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_XYZ & theCenter);

		/****************** SetHSize ******************/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "Set the hsize (half-diagonal) coordinates. all components of thehsize must be non-negative.

Parameters
----------
theHSize: gp_XYZ

Returns
-------
None
") SetHSize;
		void SetHSize(const gp_XYZ & theHSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Query the square diagonal. if the box is void (see method isvoid()) then a very big real value is returned.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transform the bounding box with the given transformation. the resulting box will be larger if thetrsf contains rotation.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
Bnd_B3d
") Transformed;
		Bnd_B3d Transformed(const gp_Trsf & theTrsf);

};


%extend Bnd_B3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class Bnd_B3f *
****************/
class Bnd_B3f {
	public:
		/****************** Bnd_B3f ******************/
		%feature("compactdefaultargs") Bnd_B3f;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_B3f;
		 Bnd_B3f();

		/****************** Bnd_B3f ******************/
		%feature("compactdefaultargs") Bnd_B3f;
		%feature("autodoc", "Constructor.

Parameters
----------
theCenter: gp_XYZ
theHSize: gp_XYZ

Returns
-------
None
") Bnd_B3f;
		 Bnd_B3f(const gp_XYZ & theCenter, const gp_XYZ & theHSize);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by a point.

Parameters
----------
thePnt: gp_XYZ

Returns
-------
None
") Add;
		void Add(const gp_XYZ & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by a point.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") Add;
		void Add(const gp_Pnt & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Update the box by another box.

Parameters
----------
theBox: Bnd_B3f

Returns
-------
None
") Add;
		void Add(const Bnd_B3f & theBox);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset the box data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Query the upper corner: (center + hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XYZ
") CornerMax;
		gp_XYZ CornerMax();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Query the lower corner: (center - hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XYZ
") CornerMin;
		gp_XYZ CornerMin();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "Extend the box by the absolute value of thediff.

Parameters
----------
theDiff: float

Returns
-------
None
") Enlarge;
		void Enlarge(const Standard_Real theDiff);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Check that the box 'this' is inside the given box 'thebox'. returns true if 'this' box is fully inside 'thebox'.

Parameters
----------
theBox: Bnd_B3f

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const Bnd_B3f & theBox);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Check that the box 'this' is inside the given box 'thebox' transformed by 'thetrsf'. returns true if 'this' box is fully inside the transformed 'thebox'.

Parameters
----------
theBox: Bnd_B3f
theTrsf: gp_Trsf

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const Bnd_B3f & theBox, const gp_Trsf & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given point for the inclusion in the box. returns true if the point is outside.

Parameters
----------
thePnt: gp_XYZ

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & thePnt);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check a sphere for the intersection with the current box. returns true if there is no intersection between boxes. if the parameter 'isspherehollow' is true, then the intersection is not reported for a box that is completely inside the sphere (otherwise this method would report an intersection).

Parameters
----------
theCenter: gp_XYZ
theRadius: float
isSphereHollow: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & theCenter, const Standard_Real theRadius, const Standard_Boolean isSphereHollow = Standard_False);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given box for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theOtherBox: Bnd_B3f

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_B3f & theOtherBox);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given box oriented by the given transformation for the intersection with the current box. returns true if there is no intersection between boxes.

Parameters
----------
theOtherBox: Bnd_B3f
theTrsf: gp_Trsf

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_B3f & theOtherBox, const gp_Trsf & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given line for the intersection with the current box. returns true if there is no intersection. isray==true means intersection check with the positive half-line theoverthickness is the addition to the size of the current box (may be negative). if positive, it can be treated as the thickness of the line 'theline' or the radius of the cylinder along 'theline'.

Parameters
----------
theLine: gp_Ax1
isRay: bool,optional
	default value is Standard_False
theOverthickness: float,optional
	default value is 0.0

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Ax1 & theLine, const Standard_Boolean isRay = Standard_False, const Standard_Real theOverthickness = 0.0);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check the given plane for the intersection with the current box. returns true if there is no intersection.

Parameters
----------
thePlane: gp_Ax3

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Ax3 & thePlane);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if the box is void (non-initialized).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Limit the box by the internals of theotherbox. returns true if the limitation takes place, otherwise false indicating that the boxes do not intersect.

Parameters
----------
theOtherBox: Bnd_B3f

Returns
-------
bool
") Limit;
		Standard_Boolean Limit(const Bnd_B3f & theOtherBox);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "Set the center coordinates.

Parameters
----------
theCenter: gp_XYZ

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_XYZ & theCenter);

		/****************** SetHSize ******************/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "Set the hsize (half-diagonal) coordinates. all components of thehsize must be non-negative.

Parameters
----------
theHSize: gp_XYZ

Returns
-------
None
") SetHSize;
		void SetHSize(const gp_XYZ & theHSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Query the square diagonal. if the box is void (see method isvoid()) then a very big real value is returned.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transform the bounding box with the given transformation. the resulting box will be larger if thetrsf contains rotation.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
Bnd_B3f
") Transformed;
		Bnd_B3f Transformed(const gp_Trsf & theTrsf);

};


%extend Bnd_B3f {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Bnd_BoundSortBox *
*************************/
class Bnd_BoundSortBox {
	public:
		/****************** Bnd_BoundSortBox ******************/
		%feature("compactdefaultargs") Bnd_BoundSortBox;
		%feature("autodoc", "Constructs an empty comparison algorithm for bounding boxes. the bounding boxes are then defined using the initialize function.

Returns
-------
None
") Bnd_BoundSortBox;
		 Bnd_BoundSortBox();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the bounding box thebox at position boxindex in the array of boxes to be sorted by this comparison algorithm. this function is used only in conjunction with the third syntax described in the synopsis of initialize. //! exceptions: //! - standard_outofrange if boxindex is not in the range [ 1,nbcomponents ] where nbcomponents is the maximum number of bounding boxes declared for this comparison algorithm at initialization. //! - standard_multiplydefined if a box already exists at position boxindex in the array of boxes to be sorted by this comparison algorithm.

Parameters
----------
theBox: Bnd_Box
boxIndex: int

Returns
-------
None
") Add;
		void Add(const Bnd_Box & theBox, const Standard_Integer boxIndex);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Compares the bounding box thebox, with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.

Parameters
----------
theBox: Bnd_Box

Returns
-------
TColStd_ListOfInteger
") Compare;
		const TColStd_ListOfInteger & Compare(const Bnd_Box & theBox);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Compares the plane p with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.

Parameters
----------
P: gp_Pln

Returns
-------
TColStd_ListOfInteger
") Compare;
		const TColStd_ListOfInteger & Compare(const gp_Pln & P);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes this comparison algorithm with - the set of bounding boxes setofbox.

Parameters
----------
CompleteBox: Bnd_Box
SetOfBox: Bnd_HArray1OfBox

Returns
-------
None
") Initialize;
		void Initialize(const Bnd_Box & CompleteBox, const opencascade::handle<Bnd_HArray1OfBox> & SetOfBox);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes this comparison algorithm with - the set of bounding boxes setofbox, where completebox is given as the global bounding box of setofbox.

Parameters
----------
SetOfBox: Bnd_HArray1OfBox

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<Bnd_HArray1OfBox> & SetOfBox);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes this comparison algorithm, giving it only - the maximum number nbcomponents of the bounding boxes to be managed. use the add function to define the array of bounding boxes to be sorted by this algorithm.

Parameters
----------
CompleteBox: Bnd_Box
nbComponents: int

Returns
-------
None
") Initialize;
		void Initialize(const Bnd_Box & CompleteBox, const Standard_Integer nbComponents);

};


%extend Bnd_BoundSortBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Bnd_BoundSortBox2d *
***************************/
class Bnd_BoundSortBox2d {
	public:
		/****************** Bnd_BoundSortBox2d ******************/
		%feature("compactdefaultargs") Bnd_BoundSortBox2d;
		%feature("autodoc", "Constructs an empty comparison algorithm for 2d bounding boxes. the bounding boxes are then defined using the initialize function.

Returns
-------
None
") Bnd_BoundSortBox2d;
		 Bnd_BoundSortBox2d();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the 2d bounding box thebox at position boxindex in the array of boxes to be sorted by this comparison algorithm. this function is used only in conjunction with the third syntax described in the synopsis of initialize. exceptions - standard_outofrange if boxindex is not in the range [ 1,nbcomponents ] where nbcomponents is the maximum number of bounding boxes declared for this comparison algorithm at initialization. - standard_multiplydefined if a box still exists at position boxindex in the array of boxes to be sorted by this comparison algorithm.

Parameters
----------
theBox: Bnd_Box2d
boxIndex: int

Returns
-------
None
") Add;
		void Add(const Bnd_Box2d & theBox, const Standard_Integer boxIndex);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Compares the 2d bounding box thebox with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.

Parameters
----------
theBox: Bnd_Box2d

Returns
-------
TColStd_ListOfInteger
") Compare;
		const TColStd_ListOfInteger & Compare(const Bnd_Box2d & theBox);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes this comparison algorithm with - the set of 2d bounding boxes setofbox.

Parameters
----------
CompleteBox: Bnd_Box2d
SetOfBox: Bnd_HArray1OfBox2d

Returns
-------
None
") Initialize;
		void Initialize(const Bnd_Box2d & CompleteBox, const opencascade::handle<Bnd_HArray1OfBox2d> & SetOfBox);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes this comparison algorithm with - the set of 2d bounding boxes setofbox, where completebox is given as the global bounding box of setofbox.

Parameters
----------
SetOfBox: Bnd_HArray1OfBox2d

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<Bnd_HArray1OfBox2d> & SetOfBox);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes this comparison algorithm, giving it only - the maximum number nbcomponents, and - the global bounding box completebox, of the 2d bounding boxes to be managed. use the add function to define the array of bounding boxes to be sorted by this algorithm.

Parameters
----------
CompleteBox: Bnd_Box2d
nbComponents: int

Returns
-------
None
") Initialize;
		void Initialize(const Bnd_Box2d & CompleteBox, const Standard_Integer nbComponents);

};


%extend Bnd_BoundSortBox2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class Bnd_Box *
****************/
class Bnd_Box {
	public:
		/****************** Bnd_Box ******************/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "Creates an empty box. the constructed box is qualified void. its gap is null.

Returns
-------
None
") Bnd_Box;
		 Bnd_Box();

		/****************** Bnd_Box ******************/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "Creates a bounding box, it contains: - minimum/maximum point of bouning box, the constructed box is qualified void. its gap is null.

Parameters
----------
theMin: gp_Pnt
theMax: gp_Pnt

Returns
-------
None
") Bnd_Box;
		 Bnd_Box(const gp_Pnt theMin, const gp_Pnt theMax);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the box <other> to <self>.

Parameters
----------
Other: Bnd_Box

Returns
-------
None
") Add;
		void Add(const Bnd_Box & Other);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a pnt to the box.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Add;
		void Add(const gp_Pnt & P);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Extends <self> from the pnt <p> in the direction <d>.

Parameters
----------
P: gp_Pnt
D: gp_Dir

Returns
-------
None
") Add;
		void Add(const gp_Pnt & P, const gp_Dir & D);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Extends the box in the given direction, i.e. adds an half-line. the box may become infinite in 1,2 or 3 directions.

Parameters
----------
D: gp_Dir

Returns
-------
None
") Add;
		void Add(const gp_Dir & D);

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Returns the upper corner of this bounding box. the gap is included. if this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- precision::infinite(). standard_constructionerror exception will be thrown if the box is void. if isvoid().

Returns
-------
gp_Pnt
") CornerMax;
		gp_Pnt CornerMax();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Returns the lower corner of this bounding box. the gap is included. if this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- precision::infinite(). standard_constructionerror exception will be thrown if the box is void. if isvoid().

Returns
-------
gp_Pnt
") CornerMin;
		gp_Pnt CornerMin();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the minimum distance between two boxes.

Parameters
----------
Other: Bnd_Box

Returns
-------
float
") Distance;
		Standard_Real Distance(const Bnd_Box & Other);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "Enlarges the box with a tolerance value. (minvalues-abs(<tol>) and maxvalues+abs(<tol>)) this means that the minimum values of its x, y and z intervals of definition, when they are finite, are reduced by the absolute value of tol, while the maximum values are increased by the same amount.

Parameters
----------
Tol: float

Returns
-------
None
") Enlarge;
		void Enlarge(const Standard_Real Tol);

		/****************** FinitePart ******************/
		%feature("compactdefaultargs") FinitePart;
		%feature("autodoc", "Returns a finite part of an infinite bounding box (returns self if this is already finite box). this can be a void box in case if its sides has been defined as infinite (open) without adding any finite points. warning! this method relies on open flags, the infinite points added using add() method will be returned as is.

Returns
-------
Bnd_Box
") FinitePart;
		Bnd_Box FinitePart();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the bounds of this bounding box. the gap is included. if this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- precision::infinite(). standard_constructionerror exception will be thrown if the box is void. if isvoid().

Parameters
----------

Returns
-------
theXmin: float
theYmin: float
theZmin: float
theXmax: float
theYmax: float
theZmax: float
") Get;
		void Get(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetGap ******************/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Returns the gap of this bounding box.

Returns
-------
float
") GetGap;
		Standard_Real GetGap();

		/****************** HasFinitePart ******************/
		%feature("compactdefaultargs") HasFinitePart;
		%feature("autodoc", "Returns true if this box has finite part.

Returns
-------
bool
") HasFinitePart;
		Standard_Boolean HasFinitePart();

		/****************** IsOpen ******************/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Returns true if this bounding box has at least one open direction.

Returns
-------
bool
") IsOpen;
		Standard_Boolean IsOpen();

		/****************** IsOpenXmax ******************/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "Returns true if this bounding box is open in the xmax direction.

Returns
-------
bool
") IsOpenXmax;
		Standard_Boolean IsOpenXmax();

		/****************** IsOpenXmin ******************/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "Returns true if this bounding box is open in the xmin direction.

Returns
-------
bool
") IsOpenXmin;
		Standard_Boolean IsOpenXmin();

		/****************** IsOpenYmax ******************/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "Returns true if this bounding box is open in the ymax direction.

Returns
-------
bool
") IsOpenYmax;
		Standard_Boolean IsOpenYmax();

		/****************** IsOpenYmin ******************/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "Returns true if this bounding box is open in the ymix direction.

Returns
-------
bool
") IsOpenYmin;
		Standard_Boolean IsOpenYmin();

		/****************** IsOpenZmax ******************/
		%feature("compactdefaultargs") IsOpenZmax;
		%feature("autodoc", "Returns true if this bounding box is open in the zmax direction.

Returns
-------
bool
") IsOpenZmax;
		Standard_Boolean IsOpenZmax();

		/****************** IsOpenZmin ******************/
		%feature("compactdefaultargs") IsOpenZmin;
		%feature("autodoc", "Returns true if this bounding box is open in the zmin direction.

Returns
-------
bool
") IsOpenZmin;
		Standard_Boolean IsOpenZmin();

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns true if the pnt is out the box.

Parameters
----------
P: gp_Pnt

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt & P);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns false if the line intersects the box.

Parameters
----------
L: gp_Lin

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Lin & L);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns false if the plane intersects the box.

Parameters
----------
P: gp_Pln

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Pln & P);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns false if the <box> intersects or is inside <self>.

Parameters
----------
Other: Bnd_Box

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_Box & Other);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns false if the transformed <box> intersects or is inside <self>.

Parameters
----------
Other: Bnd_Box
T: gp_Trsf

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_Box & Other, const gp_Trsf & T);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns false if the transformed <box> intersects or is inside the transformed box <self>.

Parameters
----------
T1: gp_Trsf
Other: Bnd_Box
T2: gp_Trsf

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Trsf & T1, const Bnd_Box & Other, const gp_Trsf & T2);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns false if the flat band lying between two parallel lines represented by their reference points <p1>, <p2> and direction <d> intersects the box.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
D: gp_Dir

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Dir & D);

		/****************** IsThin ******************/
		%feature("compactdefaultargs") IsThin;
		%feature("autodoc", "Returns true if isxthin, isythin and iszthin are all true, i.e. if the box is thin in all three dimensions.

Parameters
----------
tol: float

Returns
-------
bool
") IsThin;
		Standard_Boolean IsThin(const Standard_Real tol);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if this bounding box is empty (void flag).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** IsWhole ******************/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "Returns true if this bounding box is infinite in all 6 directions (wholespace flag).

Returns
-------
bool
") IsWhole;
		Standard_Boolean IsWhole();

		/****************** IsXThin ******************/
		%feature("compactdefaultargs") IsXThin;
		%feature("autodoc", "True if xmax-xmin < tol.

Parameters
----------
tol: float

Returns
-------
bool
") IsXThin;
		Standard_Boolean IsXThin(const Standard_Real tol);

		/****************** IsYThin ******************/
		%feature("compactdefaultargs") IsYThin;
		%feature("autodoc", "True if ymax-ymin < tol.

Parameters
----------
tol: float

Returns
-------
bool
") IsYThin;
		Standard_Boolean IsYThin(const Standard_Real tol);

		/****************** IsZThin ******************/
		%feature("compactdefaultargs") IsZThin;
		%feature("autodoc", "True if zmax-zmin < tol.

Parameters
----------
tol: float

Returns
-------
bool
") IsZThin;
		Standard_Boolean IsZThin(const Standard_Real tol);

		/****************** OpenXmax ******************/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "The box will be infinitely long in the xmax direction.

Returns
-------
None
") OpenXmax;
		void OpenXmax();

		/****************** OpenXmin ******************/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "The box will be infinitely long in the xmin direction.

Returns
-------
None
") OpenXmin;
		void OpenXmin();

		/****************** OpenYmax ******************/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "The box will be infinitely long in the ymax direction.

Returns
-------
None
") OpenYmax;
		void OpenYmax();

		/****************** OpenYmin ******************/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "The box will be infinitely long in the ymin direction.

Returns
-------
None
") OpenYmin;
		void OpenYmin();

		/****************** OpenZmax ******************/
		%feature("compactdefaultargs") OpenZmax;
		%feature("autodoc", "The box will be infinitely long in the zmax direction.

Returns
-------
None
") OpenZmax;
		void OpenZmax();

		/****************** OpenZmin ******************/
		%feature("compactdefaultargs") OpenZmin;
		%feature("autodoc", "The box will be infinitely long in the zmin direction.

Returns
-------
None
") OpenZmin;
		void OpenZmin();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets this bounding box so that it bounds - the point p. this involves first setting this bounding box to be void and then adding the point p.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Set;
		void Set(const gp_Pnt & P);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets this bounding box so that it bounds the half-line defined by point p and direction d, i.e. all points m defined by m=p+u*d, where u is greater than or equal to 0, are inside the bounding volume. this involves first setting this box to be void and then adding the half-line.

Parameters
----------
P: gp_Pnt
D: gp_Dir

Returns
-------
None
") Set;
		void Set(const gp_Pnt & P, const gp_Dir & D);

		/****************** SetGap ******************/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "Set the gap of this bounding box to abs(tol).

Parameters
----------
Tol: float

Returns
-------
None
") SetGap;
		void SetGap(const Standard_Real Tol);

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Sets this bounding box so that it is empty. all points are outside a void box.

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** SetWhole ******************/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "Sets this bounding box so that it covers the whole of 3d space. it is infinitely long in all directions.

Returns
-------
None
") SetWhole;
		void SetWhole();

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Computes the squared diagonal of me.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Returns a bounding box which is the result of applying the transformation t to this bounding box. warning applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. this is not optimal for algorithms which use it.

Parameters
----------
T: gp_Trsf

Returns
-------
Bnd_Box
") Transformed;
		Bnd_Box Transformed(const gp_Trsf & T);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Enlarges this bounding box, if required, so that it contains at least: - interval [ axmin,axmax ] in the 'x direction', - interval [ aymin,aymax ] in the 'y direction', - interval [ azmin,azmax ] in the 'z direction';.

Parameters
----------
aXmin: float
aYmin: float
aZmin: float
aXmax: float
aYmax: float
aZmax: float

Returns
-------
None
") Update;
		void Update(const Standard_Real aXmin, const Standard_Real aYmin, const Standard_Real aZmin, const Standard_Real aXmax, const Standard_Real aYmax, const Standard_Real aZmax);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Adds a point of coordinates (x,y,z) to this bounding box.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") Update;
		void Update(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

};


%extend Bnd_Box {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Bnd_Box2d *
******************/
class Bnd_Box2d {
	public:
		/****************** Bnd_Box2d ******************/
		%feature("compactdefaultargs") Bnd_Box2d;
		%feature("autodoc", "Creates an empty 2d bounding box. the constructed box is qualified void. its gap is null.

Returns
-------
None
") Bnd_Box2d;
		 Bnd_Box2d();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the 2d box <other> to <self>.

Parameters
----------
Other: Bnd_Box2d

Returns
-------
None
") Add;
		void Add(const Bnd_Box2d & Other);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the 2d point.

Parameters
----------
thePnt: gp_Pnt2d

Returns
-------
None
") Add;
		void Add(const gp_Pnt2d & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Extends bounding box from thepnt in the direction thedir.

Parameters
----------
thePnt: gp_Pnt2d
theDir: gp_Dir2d

Returns
-------
None
") Add;
		void Add(const gp_Pnt2d & thePnt, const gp_Dir2d & theDir);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Extends the box in the given direction, i.e. adds a half-line. the box may become infinite in 1 or 2 directions.

Parameters
----------
D: gp_Dir2d

Returns
-------
None
") Add;
		void Add(const gp_Dir2d & D);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "Enlarges the box with a tolerance value. this means that the minimum values of its x and y intervals of definition, when they are finite, are reduced by the absolute value of tol, while the maximum values are increased by the same amount.

Parameters
----------
theTol: float

Returns
-------
None
") Enlarge;
		void Enlarge(const Standard_Real theTol);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the bounds of this 2d bounding box. the gap is included. if this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- precision::infinite(). if isvoid().

Parameters
----------

Returns
-------
aXmin: float
aYmin: float
aXmax: float
aYmax: float
") Get;
		void Get(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetGap ******************/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Returns the gap of this 2d bounding box.

Returns
-------
float
") GetGap;
		Standard_Real GetGap();

		/****************** IsOpenXmax ******************/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "Returns true if this bounding box is open in the xmax direction.

Returns
-------
bool
") IsOpenXmax;
		Standard_Boolean IsOpenXmax();

		/****************** IsOpenXmin ******************/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "Returns true if this bounding box is open in the xmin direction.

Returns
-------
bool
") IsOpenXmin;
		Standard_Boolean IsOpenXmin();

		/****************** IsOpenYmax ******************/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "Returns true if this bounding box is open in the ymax direction.

Returns
-------
bool
") IsOpenYmax;
		Standard_Boolean IsOpenYmax();

		/****************** IsOpenYmin ******************/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "Returns true if this bounding box is open in the ymin direction.

Returns
-------
bool
") IsOpenYmin;
		Standard_Boolean IsOpenYmin();

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns true if the 2d pnt <p> is out <self>.

Parameters
----------
P: gp_Pnt2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt2d & P);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns true if <box2d> is out <self>.

Parameters
----------
Other: Bnd_Box2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_Box2d & Other);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns true if transformed <box2d> is out <self>.

Parameters
----------
theOther: Bnd_Box2d
theTrsf: gp_Trsf2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_Box2d & theOther, const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Compares a transformed bounding with a transformed bounding. the default implementation is to make a copy of <self> and <other>, to transform them and to test.

Parameters
----------
T1: gp_Trsf2d
Other: Bnd_Box2d
T2: gp_Trsf2d

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Trsf2d & T1, const Bnd_Box2d & Other, const gp_Trsf2d & T2);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if this 2d bounding box is empty (void flag).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** IsWhole ******************/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "Returns true if this bounding box is infinite in all 4 directions (whole space flag).

Returns
-------
bool
") IsWhole;
		Standard_Boolean IsWhole();

		/****************** OpenXmax ******************/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "The box will be infinitely long in the xmax direction.

Returns
-------
None
") OpenXmax;
		void OpenXmax();

		/****************** OpenXmin ******************/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "The box will be infinitely long in the xmin direction.

Returns
-------
None
") OpenXmin;
		void OpenXmin();

		/****************** OpenYmax ******************/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "The box will be infinitely long in the ymax direction.

Returns
-------
None
") OpenYmax;
		void OpenYmax();

		/****************** OpenYmin ******************/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "The box will be infinitely long in the ymin direction.

Returns
-------
None
") OpenYmin;
		void OpenYmin();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets this 2d bounding box so that it bounds the point p. this involves first setting this bounding box to be void and then adding the point pthe rectangle bounds the point <p>.

Parameters
----------
thePnt: gp_Pnt2d

Returns
-------
None
") Set;
		void Set(const gp_Pnt2d & thePnt);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets this 2d bounding box so that it bounds the half-line defined by point p and direction d, i.e. all points m defined by m=p+u*d, where u is greater than or equal to 0, are inside the bounding area. this involves first setting this 2d box to be void and then adding the half-line.

Parameters
----------
thePnt: gp_Pnt2d
theDir: gp_Dir2d

Returns
-------
None
") Set;
		void Set(const gp_Pnt2d & thePnt, const gp_Dir2d & theDir);

		/****************** SetGap ******************/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "Set the gap of this 2d bounding box to abs(tol).

Parameters
----------
Tol: float

Returns
-------
None
") SetGap;
		void SetGap(const Standard_Real Tol);

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Sets this 2d bounding box so that it is empty. all points are outside a void box.

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** SetWhole ******************/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "Sets this bounding box so that it covers the whole 2d space, i.e. it is infinite in all directions.

Returns
-------
None
") SetWhole;
		void SetWhole();

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Computes the squared diagonal of me.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Returns a bounding box which is the result of applying the transformation t to this bounding box. warning applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. this is not optimal for algorithms which use it.

Parameters
----------
T: gp_Trsf2d

Returns
-------
Bnd_Box2d
") Transformed;
		Bnd_Box2d Transformed(const gp_Trsf2d & T);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Enlarges this 2d bounding box, if required, so that it contains at least: - interval [ axmin,axmax ] in the 'x direction', - interval [ aymin,aymax ] in the 'y direction'.

Parameters
----------
aXmin: float
aYmin: float
aXmax: float
aYmax: float

Returns
-------
None
") Update;
		void Update(const Standard_Real aXmin, const Standard_Real aYmin, const Standard_Real aXmax, const Standard_Real aYmax);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Adds a point of coordinates (x,y) to this bounding box.

Parameters
----------
X: float
Y: float

Returns
-------
None
") Update;
		void Update(const Standard_Real X, const Standard_Real Y);

};


%extend Bnd_Box2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class Bnd_OBB *
****************/
class Bnd_OBB {
	public:
		/****************** Bnd_OBB ******************/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_OBB;
		 Bnd_OBB();

		/****************** Bnd_OBB ******************/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "Constructor taking all defining parameters.

Parameters
----------
theCenter: gp_Pnt
theXDirection: gp_Dir
theYDirection: gp_Dir
theZDirection: gp_Dir
theHXSize: float
theHYSize: float
theHZSize: float

Returns
-------
None
") Bnd_OBB;
		 Bnd_OBB(const gp_Pnt & theCenter, const gp_Dir & theXDirection, const gp_Dir & theYDirection, const gp_Dir & theZDirection, const Standard_Real theHXSize, const Standard_Real theHYSize, const Standard_Real theHZSize);

		/****************** Bnd_OBB ******************/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "Constructor to create obb from aabb.

Parameters
----------
theBox: Bnd_Box

Returns
-------
None
") Bnd_OBB;
		 Bnd_OBB(const Bnd_Box & theBox);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Rebuilds this in order to include all previous objects (which it was created from) and theother.

Parameters
----------
theOther: Bnd_OBB

Returns
-------
None
") Add;
		void Add(const Bnd_OBB & theOther);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Rebuilds this in order to include all previous objects (which it was created from) and thep.

Parameters
----------
theP: gp_Pnt

Returns
-------
None
") Add;
		void Add(const gp_Pnt & theP);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the center of obb.

Returns
-------
gp_XYZ
") Center;
		const gp_XYZ Center();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "Enlarges the box with the given value.

Parameters
----------
theGapAdd: float

Returns
-------
None
") Enlarge;
		void Enlarge(const Standard_Real theGapAdd);

		/****************** GetVertex ******************/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "Returns the array of vertices in <this>. the local coordinate of the vertex depending on the index of the array are follow: index == 0: (-xhsize(), -yhsize(), -zhsize()) index == 1: ( xhsize(), -yhsize(), -zhsize()) index == 2: (-xhsize(), yhsize(), -zhsize()) index == 3: ( xhsize(), yhsize(), -zhsize()) index == 4: (-xhsize(), -yhsize(), zhsize()) index == 5: ( xhsize(), -yhsize(), zhsize()) index == 6: (-xhsize(), yhsize(), zhsize()) index == 7: ( xhsize(), yhsize(), zhsize()).

Parameters
----------
theP: gp_Pnt

Returns
-------
bool
") GetVertex;
		Standard_Boolean GetVertex(gp_Pnt theP[8]);

		/****************** IsAABox ******************/
		%feature("compactdefaultargs") IsAABox;
		%feature("autodoc", "Returns true if the box is axes aligned.

Returns
-------
bool
") IsAABox;
		Standard_Boolean IsAABox();

		/****************** IsCompletelyInside ******************/
		%feature("compactdefaultargs") IsCompletelyInside;
		%feature("autodoc", "Check if the theother is completely inside *this.

Parameters
----------
theOther: Bnd_OBB

Returns
-------
bool
") IsCompletelyInside;
		Standard_Boolean IsCompletelyInside(const Bnd_OBB & theOther);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check if the box do not interfere the other box.

Parameters
----------
theOther: Bnd_OBB

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_OBB & theOther);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Check if the point is inside of <this>.

Parameters
----------
theP: gp_Pnt

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt & theP);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Checks if the box is empty.

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of this oriented box. so that applying it to axis-aligned box ((-xhsize, -yhsize, -zhsize), (xhsize, yhsize, zhsize)) will produce this oriented box. @code gp_trsf aloc; aloc.settransformation (theobb.position(), gp::xoy()); @endcode.

Returns
-------
gp_Ax3
") Position;
		gp_Ax3 Position();

		/****************** ReBuild ******************/
		%feature("compactdefaultargs") ReBuild;
		%feature("autodoc", "Creates new obb covering every point in thelistofpoints. tolerance of every such point is set by *thelistoftolerances array. if this array is not void (not null-pointer) then the resulted bnd_obb will be enlarged using tolerances of points lying on the box surface. <theisoptimal> flag defines the mode in which the obb will be built. constructing optimal box takes more time, but the resulting box is usually more tight. in case of construction of optimal obb more possible axes are checked.

Parameters
----------
theListOfPoints: TColgp_Array1OfPnt
theListOfTolerances: TColStd_Array1OfReal *,optional
	default value is 0
theIsOptimal: bool,optional
	default value is Standard_False

Returns
-------
None
") ReBuild;
		void ReBuild(const TColgp_Array1OfPnt & theListOfPoints, const TColStd_Array1OfReal * theListOfTolerances = 0, const Standard_Boolean theIsOptimal = Standard_False);

		/****************** SetAABox ******************/
		%feature("compactdefaultargs") SetAABox;
		%feature("autodoc", "Sets the flag for axes aligned box.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetAABox;
		void SetAABox(const Standard_Boolean & theFlag);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "Sets the center of obb.

Parameters
----------
theCenter: gp_Pnt

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_Pnt & theCenter);

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Clears this box.

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** SetXComponent ******************/
		%feature("compactdefaultargs") SetXComponent;
		%feature("autodoc", "Sets the x component of obb - direction and size.

Parameters
----------
theXDirection: gp_Dir
theHXSize: float

Returns
-------
None
") SetXComponent;
		void SetXComponent(const gp_Dir & theXDirection, const Standard_Real theHXSize);

		/****************** SetYComponent ******************/
		%feature("compactdefaultargs") SetYComponent;
		%feature("autodoc", "Sets the y component of obb - direction and size.

Parameters
----------
theYDirection: gp_Dir
theHYSize: float

Returns
-------
None
") SetYComponent;
		void SetYComponent(const gp_Dir & theYDirection, const Standard_Real theHYSize);

		/****************** SetZComponent ******************/
		%feature("compactdefaultargs") SetZComponent;
		%feature("autodoc", "Sets the z component of obb - direction and size.

Parameters
----------
theZDirection: gp_Dir
theHZSize: float

Returns
-------
None
") SetZComponent;
		void SetZComponent(const gp_Dir & theZDirection, const Standard_Real theHZSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Returns square diagonal of this box.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the x direction of obb.

Returns
-------
gp_XYZ
") XDirection;
		const gp_XYZ XDirection();

		/****************** XHSize ******************/
		%feature("compactdefaultargs") XHSize;
		%feature("autodoc", "Returns the x dimension of obb.

Returns
-------
float
") XHSize;
		Standard_Real XHSize();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Returns the y direction of obb.

Returns
-------
gp_XYZ
") YDirection;
		const gp_XYZ YDirection();

		/****************** YHSize ******************/
		%feature("compactdefaultargs") YHSize;
		%feature("autodoc", "Returns the y dimension of obb.

Returns
-------
float
") YHSize;
		Standard_Real YHSize();

		/****************** ZDirection ******************/
		%feature("compactdefaultargs") ZDirection;
		%feature("autodoc", "Returns the z direction of obb.

Returns
-------
gp_XYZ
") ZDirection;
		const gp_XYZ ZDirection();

		/****************** ZHSize ******************/
		%feature("compactdefaultargs") ZHSize;
		%feature("autodoc", "Returns the z dimension of obb.

Returns
-------
float
") ZHSize;
		Standard_Real ZHSize();

};


%extend Bnd_OBB {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Bnd_Range *
******************/
class Bnd_Range {
	public:
		/****************** Bnd_Range ******************/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "Default constructor. creates void range.

Returns
-------
None
") Bnd_Range;
		 Bnd_Range();

		/****************** Bnd_Range ******************/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "Constructor. never creates void range.

Parameters
----------
theMin: float
theMax: float

Returns
-------
None
") Bnd_Range;
		 Bnd_Range(const Standard_Real theMin, const Standard_Real theMax);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Extends <this> to include theparameter.

Parameters
----------
theParameter: float

Returns
-------
None
") Add;
		void Add(const Standard_Real theParameter);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Extends this range to include both ranges. @sa use method ::union() to check if two ranges overlap method merging.

Parameters
----------
theRange: Bnd_Range

Returns
-------
None
") Add;
		void Add(const Bnd_Range & theRange);

		/****************** Common ******************/
		%feature("compactdefaultargs") Common;
		%feature("autodoc", "Replaces <this> with common-part of <this> and theother.

Parameters
----------
theOther: Bnd_Range

Returns
-------
None
") Common;
		void Common(const Bnd_Range & theOther);

		/****************** Delta ******************/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "Returns range value (max-min). returns negative value for void range.

Returns
-------
float
") Delta;
		Standard_Real Delta();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "Extends this to the given value (in both side).

Parameters
----------
theDelta: float

Returns
-------
None
") Enlarge;
		void Enlarge(const Standard_Real theDelta);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Obtain first and last boundary of <this>. if <this> is void the method returns false.

Parameters
----------

Returns
-------
theFirstPar: float
theLastPar: float
") GetBounds;
		Standard_Boolean GetBounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetIntermediatePoint ******************/
		%feature("compactdefaultargs") GetIntermediatePoint;
		%feature("autodoc", "Obtain theparameter satisfied to the equation (theparameter-min)/(max-min) == thelambda. * thelambda == 0 --> min boundary will be returned; * thelambda == 0.5 --> middle point will be returned; * thelambda == 1 --> max boundary will be returned; * thelambda < 0 --> the value less than min will be returned; * thelambda > 1 --> the value greater than max will be returned. if <this> is void the method returns false.

Parameters
----------
theLambda: float

Returns
-------
theParameter: float
") GetIntermediatePoint;
		Standard_Boolean GetIntermediatePoint(const Standard_Real theLambda, Standard_Real &OutValue);

		/****************** GetMax ******************/
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "Obtain max boundary of <this>. if <this> is void the method returns false.

Parameters
----------

Returns
-------
thePar: float
") GetMax;
		Standard_Boolean GetMax(Standard_Real &OutValue);

		/****************** GetMin ******************/
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "Obtain min boundary of <this>. if <this> is void the method returns false.

Parameters
----------

Returns
-------
thePar: float
") GetMin;
		Standard_Boolean GetMin(Standard_Real &OutValue);

		/****************** IsIntersected ******************/
		%feature("compactdefaultargs") IsIntersected;
		%feature("autodoc", "Checks if <this> intersects values like theval+k*theperiod, where k is an integer number (k = 0, +/-1, +/-2, ...). returns: 0 - if <this> does not intersect the theval+k*theperiod. 1 - if <this> intersects theval+k*theperiod. 2 - if myfirst or/and mylast are equal to theval+k*theperiod. //! attention!!! if (myfirst == mylast) then this function will return only either 0 or 2.

Parameters
----------
theVal: float
thePeriod: float,optional
	default value is 0.0

Returns
-------
int
") IsIntersected;
		Standard_Integer IsIntersected(const Standard_Real theVal, const Standard_Real thePeriod = 0.0);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns true if the value is out of this range.

Parameters
----------
theValue: float

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(Standard_Real theValue);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "Returns true if the given range is out of this range.

Parameters
----------
theRange: Bnd_Range

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_Range & theRange);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Is <this> initialized.

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Initializes <this> by default parameters. makes <this> void.

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** Shift ******************/
		%feature("compactdefaultargs") Shift;
		%feature("autodoc", "Shifts <*this> by theval.

Parameters
----------
theVal: float

Returns
-------
None
") Shift;
		void Shift(const Standard_Real theVal);

		/****************** Shifted ******************/
		%feature("compactdefaultargs") Shifted;
		%feature("autodoc", "Returns the copy of <*this> shifted by theval.

Parameters
----------
theVal: float

Returns
-------
Bnd_Range
") Shifted;
		Bnd_Range Shifted(const Standard_Real theVal);

		/****************** Split ******************/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "Splits <this> to several sub-ranges by theval value (e.g. range [3, 15] will be split by theval==5 to the two ranges: [3, 5] and [5, 15]). new ranges will be pushed to thelist (thelist must be initialized correctly before calling this method). if theperiod != 0.0 then at least one boundary of new ranges (if <*this> intersects theval+k*theperiod) will be equal to theval+theperiod*k, where k is an integer number (k = 0, +/-1, +/-2, ...). (let theperiod in above example be 4 ==> we will obtain four ranges: [3, 5], [5, 9], [9, 13] and [13, 15].

Parameters
----------
theVal: float
theList: NCollection_List<Bnd_Range>
thePeriod: float,optional
	default value is 0.0

Returns
-------
None
") Split;
		void Split(const Standard_Real theVal, NCollection_List<Bnd_Range> & theList, const Standard_Real thePeriod = 0.0);

		/****************** TrimFrom ******************/
		%feature("compactdefaultargs") TrimFrom;
		%feature("autodoc", "Trims the first value in range by the given lower limit. marks range as void if the given lower value is greater than range max.

Parameters
----------
theValLower: float

Returns
-------
None
") TrimFrom;
		void TrimFrom(const Standard_Real theValLower);

		/****************** TrimTo ******************/
		%feature("compactdefaultargs") TrimTo;
		%feature("autodoc", "Trim the last value in range by the given upper limit. marks range as void if the given upper value is smaller than range max.

Parameters
----------
theValUpper: float

Returns
-------
None
") TrimTo;
		void TrimTo(const Standard_Real theValUpper);

		/****************** Union ******************/
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "Joins *this and theother to one interval. replaces *this to the result. returns false if the operation cannot be done (e.g. input arguments are empty or separated). @sa use method ::add() to merge two ranges unconditionally.

Parameters
----------
theOther: Bnd_Range

Returns
-------
bool
") Union;
		Standard_Boolean Union(const Bnd_Range & theOther);


            %extend{
                bool __eq_wrapper__(const Bnd_Range other) {
                if (*self==other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __eq__(self, right):
                try:
                    return self.__eq_wrapper__(right)
                except:
                    return False
            }
};


%extend Bnd_Range {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Bnd_Sphere *
*******************/
class Bnd_Sphere {
	public:
		/****************** Bnd_Sphere ******************/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_Sphere;
		 Bnd_Sphere();

		/****************** Bnd_Sphere ******************/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "Constructor of a definite sphere.

Parameters
----------
theCntr: gp_XYZ
theRad: float
theU: int
theV: int

Returns
-------
None
") Bnd_Sphere;
		 Bnd_Sphere(const gp_XYZ & theCntr, const Standard_Real theRad, const Standard_Integer theU, const Standard_Integer theV);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: Bnd_Sphere

Returns
-------
None
") Add;
		void Add(const Bnd_Sphere & theOther);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns center of sphere object.

Returns
-------
gp_XYZ
") Center;
		const gp_XYZ Center();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNode: gp_XYZ

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_XYZ & theNode);

		/****************** Distances ******************/
		%feature("compactdefaultargs") Distances;
		%feature("autodoc", "Calculate and return minimal and maximal distance to sphere. note: this function is tightly optimized; any modifications may affect performance!.

Parameters
----------
theXYZ: gp_XYZ

Returns
-------
theMin: float
theMax: float
") Distances;
		void Distances(const gp_XYZ & theXYZ, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: Bnd_Sphere

Returns
-------
bool
") IsOut;
		Standard_Boolean IsOut(const Bnd_Sphere & theOther);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePnt: gp_XYZ

Returns
-------
theMaxDist: float
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & thePnt, Standard_Real &OutValue);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns validity status, indicating that this sphere corresponds to a real entity.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Projects a point on entity. returns true if success.

Parameters
----------
theNode: gp_XYZ
theProjNode: gp_XYZ

Returns
-------
theDist: float
theInside: bool
") Project;
		Standard_Boolean Project(const gp_XYZ & theNode, gp_XYZ & theProjNode, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius value.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
isValid: bool

Returns
-------
None
") SetValid;
		void SetValid(const Standard_Boolean isValid);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNode: gp_XYZ

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_XYZ & theNode);

		/****************** SquareDistances ******************/
		%feature("compactdefaultargs") SquareDistances;
		%feature("autodoc", "Calculate and return minimal and maximal distance to sphere. note: this function is tightly optimized; any modifications may affect performance!.

Parameters
----------
theXYZ: gp_XYZ

Returns
-------
theMin: float
theMax: float
") SquareDistances;
		void SquareDistances(const gp_XYZ & theXYZ, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** U ******************/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Returns the u parameter on shape.

Returns
-------
int
") U;
		Standard_Integer U();

		/****************** V ******************/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Returns the v parameter on shape.

Returns
-------
int
") V;
		Standard_Integer V();

};


%extend Bnd_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Bnd_Tools *
******************/
class Bnd_Tools {
	public:
		/****************** Bnd2BVH ******************/
		%feature("compactdefaultargs") Bnd2BVH;
		%feature("autodoc", "Converts the given bnd_box2d to bvh_box.

Parameters
----------
theBox: Bnd_Box2d

Returns
-------
BVH_Box<float, 2 >
") Bnd2BVH;
		static BVH_Box<Standard_Real, 2 > Bnd2BVH(const Bnd_Box2d & theBox);

		/****************** Bnd2BVH ******************/
		%feature("compactdefaultargs") Bnd2BVH;
		%feature("autodoc", "Converts the given bnd_box to bvh_box.

Parameters
----------
theBox: Bnd_Box

Returns
-------
BVH_Box<float, 3 >
") Bnd2BVH;
		static BVH_Box<Standard_Real, 3 > Bnd2BVH(const Bnd_Box & theBox);

};


%extend Bnd_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Bnd_HArray1OfBox : public Bnd_Array1OfBox, public Standard_Transient {
  public:
    Bnd_HArray1OfBox(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfBox(const Standard_Integer theLower, const Standard_Integer theUpper, const Bnd_Array1OfBox::value_type& theValue);
    Bnd_HArray1OfBox(const Bnd_Array1OfBox& theOther);
    const Bnd_Array1OfBox& Array1();
    Bnd_Array1OfBox& ChangeArray1();
};
%make_alias(Bnd_HArray1OfBox)


class Bnd_HArray1OfSphere : public Bnd_Array1OfSphere, public Standard_Transient {
  public:
    Bnd_HArray1OfSphere(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfSphere(const Standard_Integer theLower, const Standard_Integer theUpper, const Bnd_Array1OfSphere::value_type& theValue);
    Bnd_HArray1OfSphere(const Bnd_Array1OfSphere& theOther);
    const Bnd_Array1OfSphere& Array1();
    Bnd_Array1OfSphere& ChangeArray1();
};
%make_alias(Bnd_HArray1OfSphere)


class Bnd_HArray1OfBox2d : public Bnd_Array1OfBox2d, public Standard_Transient {
  public:
    Bnd_HArray1OfBox2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfBox2d(const Standard_Integer theLower, const Standard_Integer theUpper, const Bnd_Array1OfBox2d::value_type& theValue);
    Bnd_HArray1OfBox2d(const Bnd_Array1OfBox2d& theOther);
    const Bnd_Array1OfBox2d& Array1();
    Bnd_Array1OfBox2d& ChangeArray1();
};
%make_alias(Bnd_HArray1OfBox2d)

/* harray2 classes */
/* hsequence classes */
