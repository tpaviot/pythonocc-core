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
		/**** md5 signature: 05a153cc9a0364ca513b5e6967e6a5da ****/
		%feature("compactdefaultargs") Bnd_B2d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_B2d;
		 Bnd_B2d();

		/****************** Bnd_B2d ******************/
		/**** md5 signature: 17c0f6ccddd56941af01972030df2ef0 ****/
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
		/**** md5 signature: 5a41b83e8ddc3a1a1cd39a55664162f1 ****/
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
		/**** md5 signature: fb47cc9ae52067b7096ec0cb90c2918b ****/
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
		/**** md5 signature: e289c685a30a7d3b0627615ece9fc885 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset the box data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CornerMax ******************/
		/**** md5 signature: 1784dd584e8cfc31d3728e09a86439e2 ****/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Query a box corner: (center + hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XY
") CornerMax;
		gp_XY CornerMax();

		/****************** CornerMin ******************/
		/**** md5 signature: 8b095240ce7231f536a8f6e8d516be6d ****/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Query a box corner: (center - hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XY
") CornerMin;
		gp_XY CornerMin();

		/****************** Enlarge ******************/
		/**** md5 signature: 321829e5514bc3ec051eaf36066b1620 ****/
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
		/**** md5 signature: c091f390e40f1292d67eceb838cf06c3 ****/
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
		/**** md5 signature: 3117362dd5da71da488979e19940f735 ****/
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
		/**** md5 signature: 48b93dd797eeb546fd3a80a4a2ca84e0 ****/
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
		/**** md5 signature: 7e5b89128cba75308e659a6defc8371a ****/
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
		/**** md5 signature: 3efb653c8dc72246420846203eea1273 ****/
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
		/**** md5 signature: 17a8b8e51727f4ca60578072d43469ce ****/
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
		/**** md5 signature: c77260c57f172e19b7fad4eb2644fd1b ****/
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
		/**** md5 signature: ada8aa32f1aad828e603480ce3ff6843 ****/
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
		/**** md5 signature: 471af316c61141ba4fc7aec86f38760a ****/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if the box is void (non-initialized).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Limit ******************/
		/**** md5 signature: 26119e1da9381e96c05dac51ecd1771d ****/
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
		/**** md5 signature: 41a8b8fdf5b972f76105a79658b692fb ****/
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
		/**** md5 signature: 846be3e6c71e2aec529678889adc7fa9 ****/
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
		/**** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ****/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Query the square diagonal. if the box is void (see method isvoid()) then a very big real value is returned.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		/**** md5 signature: d5a8b9e4551432e6f8ecaa019e4a6d02 ****/
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
		/**** md5 signature: a12513a02a694b42fe55f996d7ec05b4 ****/
		%feature("compactdefaultargs") Bnd_B2f;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_B2f;
		 Bnd_B2f();

		/****************** Bnd_B2f ******************/
		/**** md5 signature: 28163395c311e95645f15de688091b62 ****/
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
		/**** md5 signature: 5a41b83e8ddc3a1a1cd39a55664162f1 ****/
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
		/**** md5 signature: fb47cc9ae52067b7096ec0cb90c2918b ****/
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
		/**** md5 signature: 0e6f8cf7d7789e610f8bcd27bbe067ff ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset the box data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CornerMax ******************/
		/**** md5 signature: 1784dd584e8cfc31d3728e09a86439e2 ****/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Query a box corner: (center + hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XY
") CornerMax;
		gp_XY CornerMax();

		/****************** CornerMin ******************/
		/**** md5 signature: 8b095240ce7231f536a8f6e8d516be6d ****/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Query a box corner: (center - hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XY
") CornerMin;
		gp_XY CornerMin();

		/****************** Enlarge ******************/
		/**** md5 signature: 321829e5514bc3ec051eaf36066b1620 ****/
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
		/**** md5 signature: 80f43a0cf5df9126a456ea7cfaeb1e12 ****/
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
		/**** md5 signature: c776c579366bf15500e8c2b58f87cc1c ****/
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
		/**** md5 signature: 48b93dd797eeb546fd3a80a4a2ca84e0 ****/
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
		/**** md5 signature: 7e5b89128cba75308e659a6defc8371a ****/
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
		/**** md5 signature: 9fc7759f5aec28ee60f32f1d24857da1 ****/
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
		/**** md5 signature: 554b1f02376c7f46b6dd15c72ede7567 ****/
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
		/**** md5 signature: c77260c57f172e19b7fad4eb2644fd1b ****/
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
		/**** md5 signature: ada8aa32f1aad828e603480ce3ff6843 ****/
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
		/**** md5 signature: 471af316c61141ba4fc7aec86f38760a ****/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if the box is void (non-initialized).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Limit ******************/
		/**** md5 signature: 2e96cb9f9c5946fd77091ed749cba3e4 ****/
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
		/**** md5 signature: 41a8b8fdf5b972f76105a79658b692fb ****/
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
		/**** md5 signature: 846be3e6c71e2aec529678889adc7fa9 ****/
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
		/**** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ****/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Query the square diagonal. if the box is void (see method isvoid()) then a very big real value is returned.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		/**** md5 signature: 5f9413beb7d8b1fce20f0c331d05fa3f ****/
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
		/**** md5 signature: c716f51e2a145210c8940ea886dd7c16 ****/
		%feature("compactdefaultargs") Bnd_B3d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_B3d;
		 Bnd_B3d();

		/****************** Bnd_B3d ******************/
		/**** md5 signature: e2040c30570b4b2cb5d8085510e9c95e ****/
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
		/**** md5 signature: 4bb564ba66db61afbaab5d2355c0458e ****/
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
		/**** md5 signature: a6a1f5636f85eb3cb786a035cac1298a ****/
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
		/**** md5 signature: 331ca3351a2a0134eb1a5e205e7112ba ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset the box data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CornerMax ******************/
		/**** md5 signature: b53a8ce9727bd17e67a3d7ca6c71bf27 ****/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Query the upper corner: (center + hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XYZ
") CornerMax;
		gp_XYZ CornerMax();

		/****************** CornerMin ******************/
		/**** md5 signature: 50fe116283d2afe62e829147d21c8f48 ****/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Query the lower corner: (center - hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XYZ
") CornerMin;
		gp_XYZ CornerMin();

		/****************** Enlarge ******************/
		/**** md5 signature: 321829e5514bc3ec051eaf36066b1620 ****/
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
		/**** md5 signature: ad082b8aa93a8141ea08b5fd81cd4942 ****/
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
		/**** md5 signature: d163a00066ab25259fdcded548ff9487 ****/
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
		/**** md5 signature: 77f148dd0ff43ac75607650d2b2ca5c6 ****/
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
		/**** md5 signature: 991259fb20604eb8484572991f5f852f ****/
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
		/**** md5 signature: 36608ede356d85c57a7d843ab5185fd9 ****/
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
		/**** md5 signature: 124c734a96e8ecfd7bef2a61831976f2 ****/
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
		/**** md5 signature: d91c6eb2ee4af9f9c10c98c2980cae87 ****/
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
		/**** md5 signature: e213dc75cd4024056d6783fd970900a8 ****/
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
		/**** md5 signature: 471af316c61141ba4fc7aec86f38760a ****/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if the box is void (non-initialized).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Limit ******************/
		/**** md5 signature: ae29e5f8ea98d06b64aca1e41ff98057 ****/
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
		/**** md5 signature: 4480b29433441c49607a67067923d325 ****/
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
		/**** md5 signature: 031cb1273b6bb49a7e7a82266bdf1e6b ****/
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
		/**** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ****/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Query the square diagonal. if the box is void (see method isvoid()) then a very big real value is returned.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		/**** md5 signature: b78cd089e43b13810f743901534ce5d0 ****/
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
		/**** md5 signature: 7ac75dcf75b83316efb3587b52c61985 ****/
		%feature("compactdefaultargs") Bnd_B3f;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_B3f;
		 Bnd_B3f();

		/****************** Bnd_B3f ******************/
		/**** md5 signature: 413abb4d0731c8cb93381c3a6969033b ****/
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
		/**** md5 signature: 4bb564ba66db61afbaab5d2355c0458e ****/
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
		/**** md5 signature: a6a1f5636f85eb3cb786a035cac1298a ****/
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
		/**** md5 signature: fae70ede421e32eafed983497dd86c44 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset the box data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CornerMax ******************/
		/**** md5 signature: b53a8ce9727bd17e67a3d7ca6c71bf27 ****/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Query the upper corner: (center + hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XYZ
") CornerMax;
		gp_XYZ CornerMax();

		/****************** CornerMin ******************/
		/**** md5 signature: 50fe116283d2afe62e829147d21c8f48 ****/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Query the lower corner: (center - hsize). you must make sure that the box is not void (see isvoid()), otherwise the method returns irrelevant result.

Returns
-------
gp_XYZ
") CornerMin;
		gp_XYZ CornerMin();

		/****************** Enlarge ******************/
		/**** md5 signature: 321829e5514bc3ec051eaf36066b1620 ****/
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
		/**** md5 signature: e026c88f1974400424c832426bf5ec41 ****/
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
		/**** md5 signature: bac81427b018657e242568d3bd11311a ****/
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
		/**** md5 signature: 77f148dd0ff43ac75607650d2b2ca5c6 ****/
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
		/**** md5 signature: 991259fb20604eb8484572991f5f852f ****/
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
		/**** md5 signature: ec21879a0e85422b918e364aee4e7ed1 ****/
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
		/**** md5 signature: 4e6289bb03e357679bc6b1d1146a96be ****/
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
		/**** md5 signature: d91c6eb2ee4af9f9c10c98c2980cae87 ****/
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
		/**** md5 signature: e213dc75cd4024056d6783fd970900a8 ****/
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
		/**** md5 signature: 471af316c61141ba4fc7aec86f38760a ****/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if the box is void (non-initialized).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Limit ******************/
		/**** md5 signature: 492a5258cedbfa5b5587d22bf1bdbf97 ****/
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
		/**** md5 signature: 4480b29433441c49607a67067923d325 ****/
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
		/**** md5 signature: 031cb1273b6bb49a7e7a82266bdf1e6b ****/
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
		/**** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ****/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Query the square diagonal. if the box is void (see method isvoid()) then a very big real value is returned.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		/**** md5 signature: 9b00f2708ad3e2a9b03868d6f3a16ca5 ****/
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
		/**** md5 signature: 432937775309e427743273a6bdbe335c ****/
		%feature("compactdefaultargs") Bnd_BoundSortBox;
		%feature("autodoc", "Constructs an empty comparison algorithm for bounding boxes. the bounding boxes are then defined using the initialize function.

Returns
-------
None
") Bnd_BoundSortBox;
		 Bnd_BoundSortBox();

		/****************** Add ******************/
		/**** md5 signature: c11cd3957b9f1b070bd4a139bc72cc6d ****/
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
		/**** md5 signature: 69a2f5d307cbc61a4ae04451922de8ea ****/
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
		/**** md5 signature: bc068b36bfc32657d5d4d471cd5172bd ****/
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
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Initialize ******************/
		/**** md5 signature: dbb5dab5abfd063e114422a2e03ca032 ****/
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
		/**** md5 signature: d9688715260aa4c9c4aebee632738183 ****/
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
		/**** md5 signature: 7b0c87c850b9c7ae88cab54c565bb25d ****/
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
		/**** md5 signature: 478f70a9c2a9a079a6c4e0a33a658000 ****/
		%feature("compactdefaultargs") Bnd_BoundSortBox2d;
		%feature("autodoc", "Constructs an empty comparison algorithm for 2d bounding boxes. the bounding boxes are then defined using the initialize function.

Returns
-------
None
") Bnd_BoundSortBox2d;
		 Bnd_BoundSortBox2d();

		/****************** Add ******************/
		/**** md5 signature: 83580b6f6e6c748eb1588675cd711549 ****/
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
		/**** md5 signature: 24a301777022bc45948ea5a0b99881a4 ****/
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
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Initialize ******************/
		/**** md5 signature: eb6a134a10e4f9dc5aa588049ba86217 ****/
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
		/**** md5 signature: 69f433e11c62138b26ec73df24714664 ****/
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
		/**** md5 signature: 8057e14778fab48ce24190ff999e96d8 ****/
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
		/**** md5 signature: 1329baa12aa709d3897638f91bd6d327 ****/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "Creates an empty box. the constructed box is qualified void. its gap is null.

Returns
-------
None
") Bnd_Box;
		 Bnd_Box();

		/****************** Bnd_Box ******************/
		/**** md5 signature: 8988059a3a19778057ad20076dff426e ****/
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
		/**** md5 signature: f26c3b18c425c9af5e181dcf97365f7d ****/
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
		/**** md5 signature: b714bfb888eecda75b87221b873365bd ****/
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
		/**** md5 signature: 7e55d9c284ce09cd4dd63f85011cde45 ****/
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
		/**** md5 signature: f5e67a29cde6a6d52768287ab5d77897 ****/
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
		/**** md5 signature: ba66cc3b9f07809e242d6acf3b7b399a ****/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Returns the upper corner of this bounding box. the gap is included. if this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- precision::infinite(). standard_constructionerror exception will be thrown if the box is void. if isvoid().

Returns
-------
gp_Pnt
") CornerMax;
		gp_Pnt CornerMax();

		/****************** CornerMin ******************/
		/**** md5 signature: 986487b80ef67f31dfd8ba819cb4b46e ****/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Returns the lower corner of this bounding box. the gap is included. if this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- precision::infinite(). standard_constructionerror exception will be thrown if the box is void. if isvoid().

Returns
-------
gp_Pnt
") CornerMin;
		gp_Pnt CornerMin();

		/****************** Distance ******************/
		/**** md5 signature: 1a425f6da349f7a4118ac35c1d8396bd ****/
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
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
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
		/**** md5 signature: b5dbc37ffece9eaee81e33bf3b715eef ****/
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
		/**** md5 signature: b23462d45984e16bcf876321f08f3673 ****/
		%feature("compactdefaultargs") FinitePart;
		%feature("autodoc", "Returns a finite part of an infinite bounding box (returns self if this is already finite box). this can be a void box in case if its sides has been defined as infinite (open) without adding any finite points. warning! this method relies on open flags, the infinite points added using add() method will be returned as is.

Returns
-------
Bnd_Box
") FinitePart;
		Bnd_Box FinitePart();

		/****************** Get ******************/
		/**** md5 signature: fdcfde34f207fdeac6d324f55d7a58eb ****/
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
		/**** md5 signature: d6c52fd6b86efef444629668df8883f2 ****/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Returns the gap of this bounding box.

Returns
-------
float
") GetGap;
		Standard_Real GetGap();

		/****************** HasFinitePart ******************/
		/**** md5 signature: 6ad99adddd3d87ef1c65c750f8e0d220 ****/
		%feature("compactdefaultargs") HasFinitePart;
		%feature("autodoc", "Returns true if this box has finite part.

Returns
-------
bool
") HasFinitePart;
		Standard_Boolean HasFinitePart();

		/****************** IsOpen ******************/
		/**** md5 signature: 49b225479601710d1c8888cb2f18ffcf ****/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Returns true if this bounding box has at least one open direction.

Returns
-------
bool
") IsOpen;
		Standard_Boolean IsOpen();

		/****************** IsOpenXmax ******************/
		/**** md5 signature: 5eb2255a5bab3f2bc582219e0faf64da ****/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "Returns true if this bounding box is open in the xmax direction.

Returns
-------
bool
") IsOpenXmax;
		Standard_Boolean IsOpenXmax();

		/****************** IsOpenXmin ******************/
		/**** md5 signature: 4a3ade2dd87cecd20ab6184f8ecaf60f ****/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "Returns true if this bounding box is open in the xmin direction.

Returns
-------
bool
") IsOpenXmin;
		Standard_Boolean IsOpenXmin();

		/****************** IsOpenYmax ******************/
		/**** md5 signature: 8d1ec673e6124a1b526a06e1d5a0cfcb ****/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "Returns true if this bounding box is open in the ymax direction.

Returns
-------
bool
") IsOpenYmax;
		Standard_Boolean IsOpenYmax();

		/****************** IsOpenYmin ******************/
		/**** md5 signature: 127e30414ce069b633717ba26051232c ****/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "Returns true if this bounding box is open in the ymix direction.

Returns
-------
bool
") IsOpenYmin;
		Standard_Boolean IsOpenYmin();

		/****************** IsOpenZmax ******************/
		/**** md5 signature: 0aeb25bdfc6d9155a40cd6f7296cd574 ****/
		%feature("compactdefaultargs") IsOpenZmax;
		%feature("autodoc", "Returns true if this bounding box is open in the zmax direction.

Returns
-------
bool
") IsOpenZmax;
		Standard_Boolean IsOpenZmax();

		/****************** IsOpenZmin ******************/
		/**** md5 signature: 5f71eec5d0881e37cb676487995acd94 ****/
		%feature("compactdefaultargs") IsOpenZmin;
		%feature("autodoc", "Returns true if this bounding box is open in the zmin direction.

Returns
-------
bool
") IsOpenZmin;
		Standard_Boolean IsOpenZmin();

		/****************** IsOut ******************/
		/**** md5 signature: f348a24dbf7e40c755152f8a70e3187a ****/
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
		/**** md5 signature: 17652ecbd2ac3703da0006c5128dc63a ****/
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
		/**** md5 signature: 90ccbbde205392ec532b3171f3e59f37 ****/
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
		/**** md5 signature: 80b9d1a0a52f6e56a8774d1bdf0ade38 ****/
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
		/**** md5 signature: 178d03e597d92d4cb58b27b941435df1 ****/
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
		/**** md5 signature: bc2c0188a7939d0ab743d2dd96d12728 ****/
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
		/**** md5 signature: d6a1e498867d5cdc9886a23004f4fd8c ****/
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
		/**** md5 signature: 0254e00c3c2058c3088e4a3e19a6cd91 ****/
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
		/**** md5 signature: 9aa2fb0e94327ea2b13fa6dbf2b30845 ****/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if this bounding box is empty (void flag).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** IsWhole ******************/
		/**** md5 signature: 0a8318ed765ec359e07b16b26f838d8e ****/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "Returns true if this bounding box is infinite in all 6 directions (wholespace flag).

Returns
-------
bool
") IsWhole;
		Standard_Boolean IsWhole();

		/****************** IsXThin ******************/
		/**** md5 signature: dad1e5627442e4703d7b7ad8e0c74cdb ****/
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
		/**** md5 signature: 76bbc838755a83a7cd3d118ceea8aa53 ****/
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
		/**** md5 signature: c4fcc02c36e9759b78c1ceb3680d1b99 ****/
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
		/**** md5 signature: 011b84ef137ac1ffb641f2c1a9ac63e2 ****/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "The box will be infinitely long in the xmax direction.

Returns
-------
None
") OpenXmax;
		void OpenXmax();

		/****************** OpenXmin ******************/
		/**** md5 signature: 0cb5023d1c04bb9f8d3afb0c66dc3550 ****/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "The box will be infinitely long in the xmin direction.

Returns
-------
None
") OpenXmin;
		void OpenXmin();

		/****************** OpenYmax ******************/
		/**** md5 signature: c73a2152a30be1e92daf823e7bff7593 ****/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "The box will be infinitely long in the ymax direction.

Returns
-------
None
") OpenYmax;
		void OpenYmax();

		/****************** OpenYmin ******************/
		/**** md5 signature: 4bcf368c4cb64b3755b7b035d5243c28 ****/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "The box will be infinitely long in the ymin direction.

Returns
-------
None
") OpenYmin;
		void OpenYmin();

		/****************** OpenZmax ******************/
		/**** md5 signature: d434332e53f7c60ae595a0a8a5d503ef ****/
		%feature("compactdefaultargs") OpenZmax;
		%feature("autodoc", "The box will be infinitely long in the zmax direction.

Returns
-------
None
") OpenZmax;
		void OpenZmax();

		/****************** OpenZmin ******************/
		/**** md5 signature: 91a795a7b168cc777c5c18df8e8b6cba ****/
		%feature("compactdefaultargs") OpenZmin;
		%feature("autodoc", "The box will be infinitely long in the zmin direction.

Returns
-------
None
") OpenZmin;
		void OpenZmin();

		/****************** Set ******************/
		/**** md5 signature: db883cf63ff497749765a1588d5f0509 ****/
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
		/**** md5 signature: 945d824f108c7dfcd3451b159d172d3a ****/
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
		/**** md5 signature: 76801688da89431c55a524bd10939352 ****/
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
		/**** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ****/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Sets this bounding box so that it is empty. all points are outside a void box.

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** SetWhole ******************/
		/**** md5 signature: a40c374c51cbe4a88447c330252451e9 ****/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "Sets this bounding box so that it covers the whole of 3d space. it is infinitely long in all directions.

Returns
-------
None
") SetWhole;
		void SetWhole();

		/****************** SquareExtent ******************/
		/**** md5 signature: 25897f4ea5ade71bb993b0f1c6520c54 ****/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Computes the squared diagonal of me.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		/**** md5 signature: f8f0492ba8a9ca40222a08025b8b8169 ****/
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
		/**** md5 signature: c3930f0ed60b103221ac4d75e154bf2d ****/
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
		/**** md5 signature: e8dbda4a342ab03c84b2e5bee720848f ****/
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
		/**** md5 signature: 18bdb98247d9982c9bb8ed597d8523b6 ****/
		%feature("compactdefaultargs") Bnd_Box2d;
		%feature("autodoc", "Creates an empty 2d bounding box. the constructed box is qualified void. its gap is null.

Returns
-------
None
") Bnd_Box2d;
		 Bnd_Box2d();

		/****************** Add ******************/
		/**** md5 signature: 6f044365f28f5f8cfea2a8ef87b5d3d8 ****/
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
		/**** md5 signature: 3345fd755af32d4addfbfcf462343566 ****/
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
		/**** md5 signature: 766d7f8bedbbfef7f57fba624ff81449 ****/
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
		/**** md5 signature: 17bccdca6c22026d7b33e0b35baadcc7 ****/
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
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Enlarge ******************/
		/**** md5 signature: d42b828f55c3eec07d633e1786debcb8 ****/
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
		/**** md5 signature: 4f65ca439016927ed6232461d417c140 ****/
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
		/**** md5 signature: 6750af4846e7c73d2306166a820dd5a3 ****/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Returns the gap of this 2d bounding box.

Returns
-------
float
") GetGap;
		Standard_Real GetGap();

		/****************** IsOpenXmax ******************/
		/**** md5 signature: 5eb2255a5bab3f2bc582219e0faf64da ****/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "Returns true if this bounding box is open in the xmax direction.

Returns
-------
bool
") IsOpenXmax;
		Standard_Boolean IsOpenXmax();

		/****************** IsOpenXmin ******************/
		/**** md5 signature: 4a3ade2dd87cecd20ab6184f8ecaf60f ****/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "Returns true if this bounding box is open in the xmin direction.

Returns
-------
bool
") IsOpenXmin;
		Standard_Boolean IsOpenXmin();

		/****************** IsOpenYmax ******************/
		/**** md5 signature: 8d1ec673e6124a1b526a06e1d5a0cfcb ****/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "Returns true if this bounding box is open in the ymax direction.

Returns
-------
bool
") IsOpenYmax;
		Standard_Boolean IsOpenYmax();

		/****************** IsOpenYmin ******************/
		/**** md5 signature: 127e30414ce069b633717ba26051232c ****/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "Returns true if this bounding box is open in the ymin direction.

Returns
-------
bool
") IsOpenYmin;
		Standard_Boolean IsOpenYmin();

		/****************** IsOut ******************/
		/**** md5 signature: d03cb9c8d7fe01e19de4b31ec8638b96 ****/
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
		/**** md5 signature: 76ce93721d21d2f47dd476b923763317 ****/
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
		/**** md5 signature: 242bdc5eb7d739c8e58bf1ccf125794e ****/
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
		/**** md5 signature: 1de5bddfb807ee17935c8101289b1b30 ****/
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
		/**** md5 signature: 9aa2fb0e94327ea2b13fa6dbf2b30845 ****/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if this 2d bounding box is empty (void flag).

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** IsWhole ******************/
		/**** md5 signature: 0a8318ed765ec359e07b16b26f838d8e ****/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "Returns true if this bounding box is infinite in all 4 directions (whole space flag).

Returns
-------
bool
") IsWhole;
		Standard_Boolean IsWhole();

		/****************** OpenXmax ******************/
		/**** md5 signature: 011b84ef137ac1ffb641f2c1a9ac63e2 ****/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "The box will be infinitely long in the xmax direction.

Returns
-------
None
") OpenXmax;
		void OpenXmax();

		/****************** OpenXmin ******************/
		/**** md5 signature: 0cb5023d1c04bb9f8d3afb0c66dc3550 ****/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "The box will be infinitely long in the xmin direction.

Returns
-------
None
") OpenXmin;
		void OpenXmin();

		/****************** OpenYmax ******************/
		/**** md5 signature: c73a2152a30be1e92daf823e7bff7593 ****/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "The box will be infinitely long in the ymax direction.

Returns
-------
None
") OpenYmax;
		void OpenYmax();

		/****************** OpenYmin ******************/
		/**** md5 signature: 4bcf368c4cb64b3755b7b035d5243c28 ****/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "The box will be infinitely long in the ymin direction.

Returns
-------
None
") OpenYmin;
		void OpenYmin();

		/****************** Set ******************/
		/**** md5 signature: 20e194d14a202c4fee73c68b1bd68f73 ****/
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
		/**** md5 signature: 3c944f7f0f286da9b8af1532b3c8f1d6 ****/
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
		/**** md5 signature: fd1e2e1d937f82e7bd6e34746a51db57 ****/
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
		/**** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ****/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Sets this 2d bounding box so that it is empty. all points are outside a void box.

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** SetWhole ******************/
		/**** md5 signature: a40c374c51cbe4a88447c330252451e9 ****/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "Sets this bounding box so that it covers the whole 2d space, i.e. it is infinite in all directions.

Returns
-------
None
") SetWhole;
		void SetWhole();

		/****************** SquareExtent ******************/
		/**** md5 signature: 25897f4ea5ade71bb993b0f1c6520c54 ****/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Computes the squared diagonal of me.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** Transformed ******************/
		/**** md5 signature: 9f68554d14860db57f14fcdad98487d8 ****/
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
		/**** md5 signature: cbab599f6b79a58e1c4829eb37ff50ae ****/
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
		/**** md5 signature: 755b71c46d0e1aef441564ce8d7b156a ****/
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
		/**** md5 signature: 89e871e268e0b019a1a62d73fd55eb19 ****/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_OBB;
		 Bnd_OBB();

		/****************** Bnd_OBB ******************/
		/**** md5 signature: 9217a828a0fc36ef6ace41d448b130b0 ****/
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
		/**** md5 signature: 5c80c49300d6c6d28ac3791ffa9f9dfb ****/
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
		/**** md5 signature: 1f61a26817c8d333e27dfcdd5e33f7c7 ****/
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
		/**** md5 signature: 67fb36a9dbd11d4528c03db6f935bcb9 ****/
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
		/**** md5 signature: 46cca58f8b29223ae05354ea8a3e5417 ****/
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
		/**** md5 signature: d759fcc6f239218e61510f561f9d7a30 ****/
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
		/**** md5 signature: dd70008164910fd933486ee1e89b66ea ****/
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
		/**** md5 signature: 7148a9fa3dfaccda890cea457298eb25 ****/
		%feature("compactdefaultargs") IsAABox;
		%feature("autodoc", "Returns true if the box is axes aligned.

Returns
-------
bool
") IsAABox;
		Standard_Boolean IsAABox();

		/****************** IsCompletelyInside ******************/
		/**** md5 signature: 148285a41cd36b32b1b047410e1cb231 ****/
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
		/**** md5 signature: 3095c5adc40292ad8ea01e1ff6f5e59c ****/
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
		/**** md5 signature: 228da6a39bbd69e9e6af11076e8f64ec ****/
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
		/**** md5 signature: 9aa2fb0e94327ea2b13fa6dbf2b30845 ****/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Checks if the box is empty.

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** Position ******************/
		/**** md5 signature: abac85ad2868eb73ea9b953e87e8f5a6 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of this oriented box. so that applying it to axis-aligned box ((-xhsize, -yhsize, -zhsize), (xhsize, yhsize, zhsize)) will produce this oriented box. @code gp_trsf aloc; aloc.settransformation (theobb.position(), gp::xoy()); @endcode.

Returns
-------
gp_Ax3
") Position;
		gp_Ax3 Position();

		/****************** ReBuild ******************/
		/**** md5 signature: acf5bcc5aed4bfb9e587af3a3f44a66c ****/
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
		/**** md5 signature: 5682f586345a83106e4cd6132b55253e ****/
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
		/**** md5 signature: ecf3b6f0e545b80cc6040218013c7da9 ****/
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
		/**** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ****/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Clears this box.

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** SetXComponent ******************/
		/**** md5 signature: 3fd434ed4f088b8cf0c305d42d7f8a32 ****/
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
		/**** md5 signature: 1d3f648489c5c7522cfa155c34eb06c8 ****/
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
		/**** md5 signature: 066b299320bec5e6edce21a4bec1a6dd ****/
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
		/**** md5 signature: 25897f4ea5ade71bb993b0f1c6520c54 ****/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Returns square diagonal of this box.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** XDirection ******************/
		/**** md5 signature: 0a83cc2971cb7167c60ad6b3d7dca376 ****/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the x direction of obb.

Returns
-------
gp_XYZ
") XDirection;
		const gp_XYZ XDirection();

		/****************** XHSize ******************/
		/**** md5 signature: 526802efb4402c85f127c7018b567c47 ****/
		%feature("compactdefaultargs") XHSize;
		%feature("autodoc", "Returns the x dimension of obb.

Returns
-------
float
") XHSize;
		Standard_Real XHSize();

		/****************** YDirection ******************/
		/**** md5 signature: 744e806c5058127dad2ce76fc00590ec ****/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Returns the y direction of obb.

Returns
-------
gp_XYZ
") YDirection;
		const gp_XYZ YDirection();

		/****************** YHSize ******************/
		/**** md5 signature: 6d522f889ae8adf72911e2195e043099 ****/
		%feature("compactdefaultargs") YHSize;
		%feature("autodoc", "Returns the y dimension of obb.

Returns
-------
float
") YHSize;
		Standard_Real YHSize();

		/****************** ZDirection ******************/
		/**** md5 signature: 27b712f9ed3424a7a71c33e6948ec3cc ****/
		%feature("compactdefaultargs") ZDirection;
		%feature("autodoc", "Returns the z direction of obb.

Returns
-------
gp_XYZ
") ZDirection;
		const gp_XYZ ZDirection();

		/****************** ZHSize ******************/
		/**** md5 signature: 5638a8c206b8e411b11abbef19373825 ****/
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
		/**** md5 signature: c4e1ef542ad0477e9971285d75047d7d ****/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "Default constructor. creates void range.

Returns
-------
None
") Bnd_Range;
		 Bnd_Range();

		/****************** Bnd_Range ******************/
		/**** md5 signature: 39d4d1bfbab659fc681a5eaf9d4bcdd7 ****/
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
		/**** md5 signature: b9e6176b78191d36c23b46360c711cd9 ****/
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
		/**** md5 signature: 49550d5c240c310670e3adabff0f2431 ****/
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
		/**** md5 signature: 9f5a37a4e8b0025ffc11bc0d0f8c7cd1 ****/
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
		/**** md5 signature: e52c84a425b733662cba593f9fa45ed5 ****/
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
		/**** md5 signature: 2c37569c59dcd99db9a5ddf54944897c ****/
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
		/**** md5 signature: aa339ecf3a64a71836ac94404be96f14 ****/
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
		/**** md5 signature: c6225a019c036447a5a4ba58a34915ea ****/
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
		/**** md5 signature: 5d8b155ad152e8e5b0e41b224ac467a0 ****/
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
		/**** md5 signature: 074bd660b5e6316ea49fb8983bf41670 ****/
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
		/**** md5 signature: 123db05445d1a166445329a30c97e68b ****/
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
		/**** md5 signature: 92f904495367c13bf088bf6ede0d150a ****/
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
		/**** md5 signature: a06de79ff8a89a245c86f2e37b66f2ce ****/
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
		/**** md5 signature: 9aa2fb0e94327ea2b13fa6dbf2b30845 ****/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Is <this> initialized.

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid();

		/****************** SetVoid ******************/
		/**** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ****/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Initializes <this> by default parameters. makes <this> void.

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** Shift ******************/
		/**** md5 signature: ed2755c188238cd9b289703de65e61c2 ****/
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
		/**** md5 signature: ec2717e15f9fbc7fbbdfc0a45ff5d722 ****/
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
		/**** md5 signature: 0590e3e907e57ad90c413cd74383099a ****/
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
		/**** md5 signature: 5c6dae4ea6e830ab5b0c80e8f5a7f485 ****/
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
		/**** md5 signature: aa2a091d624f5f01b4647b1374ab8df0 ****/
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
		/**** md5 signature: a12c3e67aa639d72862c6a3a201b7784 ****/
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
		/**** md5 signature: c7419981813f88f5869f6cf8e039de21 ****/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Bnd_Sphere;
		 Bnd_Sphere();

		/****************** Bnd_Sphere ******************/
		/**** md5 signature: c3f8a006c1c390e8f88e5d3c045ceb48 ****/
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
		/**** md5 signature: e63556631cbf2ba437d3318f36771c8b ****/
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
		/**** md5 signature: c0f204842bb3fee8d6fd43ddb0e66ea1 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns center of sphere object.

Returns
-------
gp_XYZ
") Center;
		const gp_XYZ Center();

		/****************** Distance ******************/
		/**** md5 signature: a56aeb5272160f8dff3400c26d338428 ****/
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
		/**** md5 signature: 50de2161c1d914223675c67632adce8e ****/
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
		/**** md5 signature: 58212268d92d4726dde0412ccb4e0901 ****/
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
		/**** md5 signature: 0960ab8022e734d37aad310b0486e970 ****/
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
		/**** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns validity status, indicating that this sphere corresponds to a real entity.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Project ******************/
		/**** md5 signature: afce8f38342e2faa636831f45756a1f8 ****/
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
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius value.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetValid ******************/
		/**** md5 signature: 027a3b33b6159b61ed6210ad45f0f977 ****/
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
		/**** md5 signature: 44a8f70b9596aee83a101854ca831bdd ****/
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
		/**** md5 signature: 0115354ec7c961d10a14dc6ca650e8d9 ****/
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
		/**** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ****/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") SquareExtent;
		Standard_Real SquareExtent();

		/****************** U ******************/
		/**** md5 signature: 4386b8f210f0e77f0b54d3c67203a6aa ****/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Returns the u parameter on shape.

Returns
-------
int
") U;
		Standard_Integer U();

		/****************** V ******************/
		/**** md5 signature: ec40bf56ed7e6d7231afb79a2fb7ca46 ****/
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
		/**** md5 signature: cb874faf532c5f417d96e7f24657756b ****/
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
		/**** md5 signature: 91eae1d8889c489de53fa29abb792a4c ****/
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
