/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_bnd.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Bnd_HArray1OfBox)
%wrap_handle(Bnd_HArray1OfBox2d)
%wrap_handle(Bnd_HArray1OfSphere)
/* end handles declaration */

/* templates */
%template(Bnd_Array1OfBox) NCollection_Array1<Bnd_Box>;
Array1ExtendIter(Bnd_Box)

%template(Bnd_Array1OfBox2d) NCollection_Array1<Bnd_Box2d>;
Array1ExtendIter(Bnd_Box2d)

%template(Bnd_Array1OfSphere) NCollection_Array1<Bnd_Sphere>;
Array1ExtendIter(Bnd_Sphere)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Bnd_Box> Bnd_Array1OfBox;
typedef NCollection_Array1<Bnd_Box2d> Bnd_Array1OfBox2d;
typedef NCollection_Array1<Bnd_Sphere> Bnd_Array1OfSphere;
/* end typedefs declaration */

/****************
* class Bnd_B2d *
****************/
class Bnd_B2d {
	public:
		/****** Bnd_B2d::Bnd_B2d ******/
		/****** md5 signature: 05a153cc9a0364ca513b5e6967e6a5da ******/
		%feature("compactdefaultargs") Bnd_B2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Bnd_B2d;
		 Bnd_B2d();

		/****** Bnd_B2d::Bnd_B2d ******/
		/****** md5 signature: 17c0f6ccddd56941af01972030df2ef0 ******/
		%feature("compactdefaultargs") Bnd_B2d;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XY
theHSize: gp_XY

Return
-------
None

Description
-----------
Constructor.
") Bnd_B2d;
		 Bnd_B2d(const gp_XY & theCenter, const gp_XY & theHSize);

		/****** Bnd_B2d::Add ******/
		/****** md5 signature: 5a41b83e8ddc3a1a1cd39a55664162f1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XY

Return
-------
None

Description
-----------
Update the box by a point.
") Add;
		void Add(const gp_XY & thePnt);

		/****** Bnd_B2d::Add ******/
		/****** md5 signature: fb47cc9ae52067b7096ec0cb90c2918b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Update the box by a point.
") Add;
		void Add(const gp_Pnt2d & thePnt);

		/****** Bnd_B2d::Add ******/
		/****** md5 signature: e289c685a30a7d3b0627615ece9fc885 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B2d

Return
-------
None

Description
-----------
Update the box by another box.
") Add;
		void Add(const Bnd_B2d & theBox);

		/****** Bnd_B2d::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the box data.
") Clear;
		void Clear();

		/****** Bnd_B2d::CornerMax ******/
		/****** md5 signature: 1784dd584e8cfc31d3728e09a86439e2 ******/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Query a box corner: (Center + HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
") CornerMax;
		gp_XY CornerMax();

		/****** Bnd_B2d::CornerMin ******/
		/****** md5 signature: 8b095240ce7231f536a8f6e8d516be6d ******/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Query a box corner: (Center - HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
") CornerMin;
		gp_XY CornerMin();

		/****** Bnd_B2d::Enlarge ******/
		/****** md5 signature: 321829e5514bc3ec051eaf36066b1620 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theDiff: float

Return
-------
None

Description
-----------
Extend the Box by the absolute value of theDiff.
") Enlarge;
		void Enlarge(const Standard_Real theDiff);

		/****** Bnd_B2d::IsIn ******/
		/****** md5 signature: c091f390e40f1292d67eceb838cf06c3 ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B2d

Return
-------
bool

Description
-----------
Check that the box 'this' is inside the given box 'theBox'. Returns True if 'this' box is fully inside 'theBox'.
") IsIn;
		Standard_Boolean IsIn(const Bnd_B2d & theBox);

		/****** Bnd_B2d::IsIn ******/
		/****** md5 signature: 3117362dd5da71da488979e19940f735 ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B2d
theTrsf: gp_Trsf2d

Return
-------
bool

Description
-----------
Check that the box 'this' is inside the given box 'theBox' transformed by 'theTrsf'. Returns True if 'this' box is fully inside the transformed 'theBox'.
") IsIn;
		Standard_Boolean IsIn(const Bnd_B2d & theBox, const gp_Trsf2d & theTrsf);

		/****** Bnd_B2d::IsOut ******/
		/****** md5 signature: 48b93dd797eeb546fd3a80a4a2ca84e0 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XY

Return
-------
bool

Description
-----------
Check the given point for the inclusion in the Box. Returns True if the point is outside.
") IsOut;
		Standard_Boolean IsOut(const gp_XY & thePnt);

		/****** Bnd_B2d::IsOut ******/
		/****** md5 signature: 7e5b89128cba75308e659a6defc8371a ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XY
theRadius: float
isCircleHollow: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Check a circle for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const gp_XY & theCenter, const Standard_Real theRadius, const Standard_Boolean isCircleHollow = Standard_False);

		/****** Bnd_B2d::IsOut ******/
		/****** md5 signature: 3efb653c8dc72246420846203eea1273 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B2d

Return
-------
bool

Description
-----------
Check the given box for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const Bnd_B2d & theOtherBox);

		/****** Bnd_B2d::IsOut ******/
		/****** md5 signature: 17a8b8e51727f4ca60578072d43469ce ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B2d
theTrsf: gp_Trsf2d

Return
-------
bool

Description
-----------
Check the given box oriented by the given transformation for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const Bnd_B2d & theOtherBox, const gp_Trsf2d & theTrsf);

		/****** Bnd_B2d::IsOut ******/
		/****** md5 signature: c77260c57f172e19b7fad4eb2644fd1b ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Ax2d

Return
-------
bool

Description
-----------
Check the given Line for the intersection with the current box. Returns True if there is no intersection.
") IsOut;
		Standard_Boolean IsOut(const gp_Ax2d & theLine);

		/****** Bnd_B2d::IsOut ******/
		/****** md5 signature: ada8aa32f1aad828e603480ce3ff6843 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theP0: gp_XY
theP1: gp_XY

Return
-------
bool

Description
-----------
Check the Segment defined by the couple of input points for the intersection with the current box. Returns True if there is no intersection.
") IsOut;
		Standard_Boolean IsOut(const gp_XY & theP0, const gp_XY & theP1);

		/****** Bnd_B2d::IsVoid ******/
		/****** md5 signature: 471af316c61141ba4fc7aec86f38760a ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the box is void (non-initialized).
") IsVoid;
		Standard_Boolean IsVoid();

		/****** Bnd_B2d::Limit ******/
		/****** md5 signature: 26119e1da9381e96c05dac51ecd1771d ******/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B2d

Return
-------
bool

Description
-----------
Limit the Box by the internals of theOtherBox. Returns True if the limitation takes place, otherwise False indicating that the boxes do not intersect.
") Limit;
		Standard_Boolean Limit(const Bnd_B2d & theOtherBox);

		/****** Bnd_B2d::SetCenter ******/
		/****** md5 signature: 41a8b8fdf5b972f76105a79658b692fb ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XY

Return
-------
None

Description
-----------
Set the Center coordinates.
") SetCenter;
		void SetCenter(const gp_XY & theCenter);

		/****** Bnd_B2d::SetHSize ******/
		/****** md5 signature: 846be3e6c71e2aec529678889adc7fa9 ******/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "
Parameters
----------
theHSize: gp_XY

Return
-------
None

Description
-----------
Set the HSize (half-diagonal) coordinates. All components of theHSize must be non-negative.
") SetHSize;
		void SetHSize(const gp_XY & theHSize);

		/****** Bnd_B2d::SquareExtent ******/
		/****** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
float

Description
-----------
Query the square diagonal. If the box is VOID (see method IsVoid()) then a very big real value is returned.
") SquareExtent;
		Standard_Real SquareExtent();

		/****** Bnd_B2d::Transformed ******/
		/****** md5 signature: d5a8b9e4551432e6f8ecaa019e4a6d02 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf2d

Return
-------
Bnd_B2d

Description
-----------
Transform the bounding box with the given transformation. The resulting box will be larger if theTrsf contains rotation.
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
		/****** Bnd_B2f::Bnd_B2f ******/
		/****** md5 signature: a12513a02a694b42fe55f996d7ec05b4 ******/
		%feature("compactdefaultargs") Bnd_B2f;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Bnd_B2f;
		 Bnd_B2f();

		/****** Bnd_B2f::Bnd_B2f ******/
		/****** md5 signature: 28163395c311e95645f15de688091b62 ******/
		%feature("compactdefaultargs") Bnd_B2f;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XY
theHSize: gp_XY

Return
-------
None

Description
-----------
Constructor.
") Bnd_B2f;
		 Bnd_B2f(const gp_XY & theCenter, const gp_XY & theHSize);

		/****** Bnd_B2f::Add ******/
		/****** md5 signature: 5a41b83e8ddc3a1a1cd39a55664162f1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XY

Return
-------
None

Description
-----------
Update the box by a point.
") Add;
		void Add(const gp_XY & thePnt);

		/****** Bnd_B2f::Add ******/
		/****** md5 signature: fb47cc9ae52067b7096ec0cb90c2918b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Update the box by a point.
") Add;
		void Add(const gp_Pnt2d & thePnt);

		/****** Bnd_B2f::Add ******/
		/****** md5 signature: 0e6f8cf7d7789e610f8bcd27bbe067ff ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B2f

Return
-------
None

Description
-----------
Update the box by another box.
") Add;
		void Add(const Bnd_B2f & theBox);

		/****** Bnd_B2f::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the box data.
") Clear;
		void Clear();

		/****** Bnd_B2f::CornerMax ******/
		/****** md5 signature: 1784dd584e8cfc31d3728e09a86439e2 ******/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Query a box corner: (Center + HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
") CornerMax;
		gp_XY CornerMax();

		/****** Bnd_B2f::CornerMin ******/
		/****** md5 signature: 8b095240ce7231f536a8f6e8d516be6d ******/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Query a box corner: (Center - HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
") CornerMin;
		gp_XY CornerMin();

		/****** Bnd_B2f::Enlarge ******/
		/****** md5 signature: 321829e5514bc3ec051eaf36066b1620 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theDiff: float

Return
-------
None

Description
-----------
Extend the Box by the absolute value of theDiff.
") Enlarge;
		void Enlarge(const Standard_Real theDiff);

		/****** Bnd_B2f::IsIn ******/
		/****** md5 signature: 80f43a0cf5df9126a456ea7cfaeb1e12 ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B2f

Return
-------
bool

Description
-----------
Check that the box 'this' is inside the given box 'theBox'. Returns True if 'this' box is fully inside 'theBox'.
") IsIn;
		Standard_Boolean IsIn(const Bnd_B2f & theBox);

		/****** Bnd_B2f::IsIn ******/
		/****** md5 signature: c776c579366bf15500e8c2b58f87cc1c ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B2f
theTrsf: gp_Trsf2d

Return
-------
bool

Description
-----------
Check that the box 'this' is inside the given box 'theBox' transformed by 'theTrsf'. Returns True if 'this' box is fully inside the transformed 'theBox'.
") IsIn;
		Standard_Boolean IsIn(const Bnd_B2f & theBox, const gp_Trsf2d & theTrsf);

		/****** Bnd_B2f::IsOut ******/
		/****** md5 signature: 48b93dd797eeb546fd3a80a4a2ca84e0 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XY

Return
-------
bool

Description
-----------
Check the given point for the inclusion in the Box. Returns True if the point is outside.
") IsOut;
		Standard_Boolean IsOut(const gp_XY & thePnt);

		/****** Bnd_B2f::IsOut ******/
		/****** md5 signature: 7e5b89128cba75308e659a6defc8371a ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XY
theRadius: float
isCircleHollow: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Check a circle for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const gp_XY & theCenter, const Standard_Real theRadius, const Standard_Boolean isCircleHollow = Standard_False);

		/****** Bnd_B2f::IsOut ******/
		/****** md5 signature: 9fc7759f5aec28ee60f32f1d24857da1 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B2f

Return
-------
bool

Description
-----------
Check the given box for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const Bnd_B2f & theOtherBox);

		/****** Bnd_B2f::IsOut ******/
		/****** md5 signature: 554b1f02376c7f46b6dd15c72ede7567 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B2f
theTrsf: gp_Trsf2d

Return
-------
bool

Description
-----------
Check the given box oriented by the given transformation for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const Bnd_B2f & theOtherBox, const gp_Trsf2d & theTrsf);

		/****** Bnd_B2f::IsOut ******/
		/****** md5 signature: c77260c57f172e19b7fad4eb2644fd1b ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Ax2d

Return
-------
bool

Description
-----------
Check the given Line for the intersection with the current box. Returns True if there is no intersection.
") IsOut;
		Standard_Boolean IsOut(const gp_Ax2d & theLine);

		/****** Bnd_B2f::IsOut ******/
		/****** md5 signature: ada8aa32f1aad828e603480ce3ff6843 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theP0: gp_XY
theP1: gp_XY

Return
-------
bool

Description
-----------
Check the Segment defined by the couple of input points for the intersection with the current box. Returns True if there is no intersection.
") IsOut;
		Standard_Boolean IsOut(const gp_XY & theP0, const gp_XY & theP1);

		/****** Bnd_B2f::IsVoid ******/
		/****** md5 signature: 471af316c61141ba4fc7aec86f38760a ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the box is void (non-initialized).
") IsVoid;
		Standard_Boolean IsVoid();

		/****** Bnd_B2f::Limit ******/
		/****** md5 signature: 2e96cb9f9c5946fd77091ed749cba3e4 ******/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B2f

Return
-------
bool

Description
-----------
Limit the Box by the internals of theOtherBox. Returns True if the limitation takes place, otherwise False indicating that the boxes do not intersect.
") Limit;
		Standard_Boolean Limit(const Bnd_B2f & theOtherBox);

		/****** Bnd_B2f::SetCenter ******/
		/****** md5 signature: 41a8b8fdf5b972f76105a79658b692fb ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XY

Return
-------
None

Description
-----------
Set the Center coordinates.
") SetCenter;
		void SetCenter(const gp_XY & theCenter);

		/****** Bnd_B2f::SetHSize ******/
		/****** md5 signature: 846be3e6c71e2aec529678889adc7fa9 ******/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "
Parameters
----------
theHSize: gp_XY

Return
-------
None

Description
-----------
Set the HSize (half-diagonal) coordinates. All components of theHSize must be non-negative.
") SetHSize;
		void SetHSize(const gp_XY & theHSize);

		/****** Bnd_B2f::SquareExtent ******/
		/****** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
float

Description
-----------
Query the square diagonal. If the box is VOID (see method IsVoid()) then a very big real value is returned.
") SquareExtent;
		Standard_Real SquareExtent();

		/****** Bnd_B2f::Transformed ******/
		/****** md5 signature: 5f9413beb7d8b1fce20f0c331d05fa3f ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf2d

Return
-------
Bnd_B2f

Description
-----------
Transform the bounding box with the given transformation. The resulting box will be larger if theTrsf contains rotation.
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
		/****** Bnd_B3d::Bnd_B3d ******/
		/****** md5 signature: c716f51e2a145210c8940ea886dd7c16 ******/
		%feature("compactdefaultargs") Bnd_B3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Bnd_B3d;
		 Bnd_B3d();

		/****** Bnd_B3d::Bnd_B3d ******/
		/****** md5 signature: e2040c30570b4b2cb5d8085510e9c95e ******/
		%feature("compactdefaultargs") Bnd_B3d;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XYZ
theHSize: gp_XYZ

Return
-------
None

Description
-----------
Constructor.
") Bnd_B3d;
		 Bnd_B3d(const gp_XYZ & theCenter, const gp_XYZ & theHSize);

		/****** Bnd_B3d::Add ******/
		/****** md5 signature: 4bb564ba66db61afbaab5d2355c0458e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ

Return
-------
None

Description
-----------
Update the box by a point.
") Add;
		void Add(const gp_XYZ & thePnt);

		/****** Bnd_B3d::Add ******/
		/****** md5 signature: a6a1f5636f85eb3cb786a035cac1298a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Update the box by a point.
") Add;
		void Add(const gp_Pnt & thePnt);

		/****** Bnd_B3d::Add ******/
		/****** md5 signature: 331ca3351a2a0134eb1a5e205e7112ba ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B3d

Return
-------
None

Description
-----------
Update the box by another box.
") Add;
		void Add(const Bnd_B3d & theBox);

		/****** Bnd_B3d::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the box data.
") Clear;
		void Clear();

		/****** Bnd_B3d::CornerMax ******/
		/****** md5 signature: b53a8ce9727bd17e67a3d7ca6c71bf27 ******/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Query the upper corner: (Center + HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
") CornerMax;
		gp_XYZ CornerMax();

		/****** Bnd_B3d::CornerMin ******/
		/****** md5 signature: 50fe116283d2afe62e829147d21c8f48 ******/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Query the lower corner: (Center - HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
") CornerMin;
		gp_XYZ CornerMin();

		/****** Bnd_B3d::Enlarge ******/
		/****** md5 signature: 321829e5514bc3ec051eaf36066b1620 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theDiff: float

Return
-------
None

Description
-----------
Extend the Box by the absolute value of theDiff.
") Enlarge;
		void Enlarge(const Standard_Real theDiff);

		/****** Bnd_B3d::IsIn ******/
		/****** md5 signature: ad082b8aa93a8141ea08b5fd81cd4942 ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B3d

Return
-------
bool

Description
-----------
Check that the box 'this' is inside the given box 'theBox'. Returns True if 'this' box is fully inside 'theBox'.
") IsIn;
		Standard_Boolean IsIn(const Bnd_B3d & theBox);

		/****** Bnd_B3d::IsIn ******/
		/****** md5 signature: d163a00066ab25259fdcded548ff9487 ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B3d
theTrsf: gp_Trsf

Return
-------
bool

Description
-----------
Check that the box 'this' is inside the given box 'theBox' transformed by 'theTrsf'. Returns True if 'this' box is fully inside the transformed 'theBox'.
") IsIn;
		Standard_Boolean IsIn(const Bnd_B3d & theBox, const gp_Trsf & theTrsf);

		/****** Bnd_B3d::IsOut ******/
		/****** md5 signature: 77f148dd0ff43ac75607650d2b2ca5c6 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ

Return
-------
bool

Description
-----------
Check the given point for the inclusion in the Box. Returns True if the point is outside.
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & thePnt);

		/****** Bnd_B3d::IsOut ******/
		/****** md5 signature: 991259fb20604eb8484572991f5f852f ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XYZ
theRadius: float
isSphereHollow: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Check a sphere for the intersection with the current box. Returns True if there is no intersection between boxes. If the parameter 'IsSphereHollow' is True, then the intersection is not reported for a box that is completely inside the sphere (otherwise this method would report an intersection).
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & theCenter, const Standard_Real theRadius, const Standard_Boolean isSphereHollow = Standard_False);

		/****** Bnd_B3d::IsOut ******/
		/****** md5 signature: 36608ede356d85c57a7d843ab5185fd9 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B3d

Return
-------
bool

Description
-----------
Check the given box for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const Bnd_B3d & theOtherBox);

		/****** Bnd_B3d::IsOut ******/
		/****** md5 signature: 124c734a96e8ecfd7bef2a61831976f2 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B3d
theTrsf: gp_Trsf

Return
-------
bool

Description
-----------
Check the given box oriented by the given transformation for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const Bnd_B3d & theOtherBox, const gp_Trsf & theTrsf);

		/****** Bnd_B3d::IsOut ******/
		/****** md5 signature: d91c6eb2ee4af9f9c10c98c2980cae87 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Ax1
isRay: bool (optional, default to Standard_False)
theOverthickness: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Check the given Line for the intersection with the current box. Returns True if there is no intersection. isRay==True means intersection check with the positive half-line theOverthickness is the addition to the size of the current box (may be negative). If positive, it can be treated as the thickness of the line 'theLine' or the radius of the cylinder along 'theLine'.
") IsOut;
		Standard_Boolean IsOut(const gp_Ax1 & theLine, const Standard_Boolean isRay = Standard_False, const Standard_Real theOverthickness = 0.0);

		/****** Bnd_B3d::IsOut ******/
		/****** md5 signature: e213dc75cd4024056d6783fd970900a8 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Ax3

Return
-------
bool

Description
-----------
Check the given Plane for the intersection with the current box. Returns True if there is no intersection.
") IsOut;
		Standard_Boolean IsOut(const gp_Ax3 & thePlane);

		/****** Bnd_B3d::IsVoid ******/
		/****** md5 signature: 471af316c61141ba4fc7aec86f38760a ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the box is void (non-initialized).
") IsVoid;
		Standard_Boolean IsVoid();

		/****** Bnd_B3d::Limit ******/
		/****** md5 signature: ae29e5f8ea98d06b64aca1e41ff98057 ******/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B3d

Return
-------
bool

Description
-----------
Limit the Box by the internals of theOtherBox. Returns True if the limitation takes place, otherwise False indicating that the boxes do not intersect.
") Limit;
		Standard_Boolean Limit(const Bnd_B3d & theOtherBox);

		/****** Bnd_B3d::SetCenter ******/
		/****** md5 signature: 4480b29433441c49607a67067923d325 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XYZ

Return
-------
None

Description
-----------
Set the Center coordinates.
") SetCenter;
		void SetCenter(const gp_XYZ & theCenter);

		/****** Bnd_B3d::SetHSize ******/
		/****** md5 signature: 031cb1273b6bb49a7e7a82266bdf1e6b ******/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "
Parameters
----------
theHSize: gp_XYZ

Return
-------
None

Description
-----------
Set the HSize (half-diagonal) coordinates. All components of theHSize must be non-negative.
") SetHSize;
		void SetHSize(const gp_XYZ & theHSize);

		/****** Bnd_B3d::SquareExtent ******/
		/****** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
float

Description
-----------
Query the square diagonal. If the box is VOID (see method IsVoid()) then a very big real value is returned.
") SquareExtent;
		Standard_Real SquareExtent();

		/****** Bnd_B3d::Transformed ******/
		/****** md5 signature: b78cd089e43b13810f743901534ce5d0 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
Bnd_B3d

Description
-----------
Transform the bounding box with the given transformation. The resulting box will be larger if theTrsf contains rotation.
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
		/****** Bnd_B3f::Bnd_B3f ******/
		/****** md5 signature: 7ac75dcf75b83316efb3587b52c61985 ******/
		%feature("compactdefaultargs") Bnd_B3f;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Bnd_B3f;
		 Bnd_B3f();

		/****** Bnd_B3f::Bnd_B3f ******/
		/****** md5 signature: 413abb4d0731c8cb93381c3a6969033b ******/
		%feature("compactdefaultargs") Bnd_B3f;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XYZ
theHSize: gp_XYZ

Return
-------
None

Description
-----------
Constructor.
") Bnd_B3f;
		 Bnd_B3f(const gp_XYZ & theCenter, const gp_XYZ & theHSize);

		/****** Bnd_B3f::Add ******/
		/****** md5 signature: 4bb564ba66db61afbaab5d2355c0458e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ

Return
-------
None

Description
-----------
Update the box by a point.
") Add;
		void Add(const gp_XYZ & thePnt);

		/****** Bnd_B3f::Add ******/
		/****** md5 signature: a6a1f5636f85eb3cb786a035cac1298a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Update the box by a point.
") Add;
		void Add(const gp_Pnt & thePnt);

		/****** Bnd_B3f::Add ******/
		/****** md5 signature: fae70ede421e32eafed983497dd86c44 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B3f

Return
-------
None

Description
-----------
Update the box by another box.
") Add;
		void Add(const Bnd_B3f & theBox);

		/****** Bnd_B3f::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the box data.
") Clear;
		void Clear();

		/****** Bnd_B3f::CornerMax ******/
		/****** md5 signature: b53a8ce9727bd17e67a3d7ca6c71bf27 ******/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Query the upper corner: (Center + HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
") CornerMax;
		gp_XYZ CornerMax();

		/****** Bnd_B3f::CornerMin ******/
		/****** md5 signature: 50fe116283d2afe62e829147d21c8f48 ******/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Query the lower corner: (Center - HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
") CornerMin;
		gp_XYZ CornerMin();

		/****** Bnd_B3f::Enlarge ******/
		/****** md5 signature: 321829e5514bc3ec051eaf36066b1620 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theDiff: float

Return
-------
None

Description
-----------
Extend the Box by the absolute value of theDiff.
") Enlarge;
		void Enlarge(const Standard_Real theDiff);

		/****** Bnd_B3f::IsIn ******/
		/****** md5 signature: e026c88f1974400424c832426bf5ec41 ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B3f

Return
-------
bool

Description
-----------
Check that the box 'this' is inside the given box 'theBox'. Returns True if 'this' box is fully inside 'theBox'.
") IsIn;
		Standard_Boolean IsIn(const Bnd_B3f & theBox);

		/****** Bnd_B3f::IsIn ******/
		/****** md5 signature: bac81427b018657e242568d3bd11311a ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B3f
theTrsf: gp_Trsf

Return
-------
bool

Description
-----------
Check that the box 'this' is inside the given box 'theBox' transformed by 'theTrsf'. Returns True if 'this' box is fully inside the transformed 'theBox'.
") IsIn;
		Standard_Boolean IsIn(const Bnd_B3f & theBox, const gp_Trsf & theTrsf);

		/****** Bnd_B3f::IsOut ******/
		/****** md5 signature: 77f148dd0ff43ac75607650d2b2ca5c6 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ

Return
-------
bool

Description
-----------
Check the given point for the inclusion in the Box. Returns True if the point is outside.
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & thePnt);

		/****** Bnd_B3f::IsOut ******/
		/****** md5 signature: 991259fb20604eb8484572991f5f852f ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XYZ
theRadius: float
isSphereHollow: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Check a sphere for the intersection with the current box. Returns True if there is no intersection between boxes. If the parameter 'IsSphereHollow' is True, then the intersection is not reported for a box that is completely inside the sphere (otherwise this method would report an intersection).
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & theCenter, const Standard_Real theRadius, const Standard_Boolean isSphereHollow = Standard_False);

		/****** Bnd_B3f::IsOut ******/
		/****** md5 signature: ec21879a0e85422b918e364aee4e7ed1 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B3f

Return
-------
bool

Description
-----------
Check the given box for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const Bnd_B3f & theOtherBox);

		/****** Bnd_B3f::IsOut ******/
		/****** md5 signature: 4e6289bb03e357679bc6b1d1146a96be ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B3f
theTrsf: gp_Trsf

Return
-------
bool

Description
-----------
Check the given box oriented by the given transformation for the intersection with the current box. Returns True if there is no intersection between boxes.
") IsOut;
		Standard_Boolean IsOut(const Bnd_B3f & theOtherBox, const gp_Trsf & theTrsf);

		/****** Bnd_B3f::IsOut ******/
		/****** md5 signature: d91c6eb2ee4af9f9c10c98c2980cae87 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Ax1
isRay: bool (optional, default to Standard_False)
theOverthickness: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Check the given Line for the intersection with the current box. Returns True if there is no intersection. isRay==True means intersection check with the positive half-line theOverthickness is the addition to the size of the current box (may be negative). If positive, it can be treated as the thickness of the line 'theLine' or the radius of the cylinder along 'theLine'.
") IsOut;
		Standard_Boolean IsOut(const gp_Ax1 & theLine, const Standard_Boolean isRay = Standard_False, const Standard_Real theOverthickness = 0.0);

		/****** Bnd_B3f::IsOut ******/
		/****** md5 signature: e213dc75cd4024056d6783fd970900a8 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Ax3

Return
-------
bool

Description
-----------
Check the given Plane for the intersection with the current box. Returns True if there is no intersection.
") IsOut;
		Standard_Boolean IsOut(const gp_Ax3 & thePlane);

		/****** Bnd_B3f::IsVoid ******/
		/****** md5 signature: 471af316c61141ba4fc7aec86f38760a ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the box is void (non-initialized).
") IsVoid;
		Standard_Boolean IsVoid();

		/****** Bnd_B3f::Limit ******/
		/****** md5 signature: 492a5258cedbfa5b5587d22bf1bdbf97 ******/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "
Parameters
----------
theOtherBox: Bnd_B3f

Return
-------
bool

Description
-----------
Limit the Box by the internals of theOtherBox. Returns True if the limitation takes place, otherwise False indicating that the boxes do not intersect.
") Limit;
		Standard_Boolean Limit(const Bnd_B3f & theOtherBox);

		/****** Bnd_B3f::SetCenter ******/
		/****** md5 signature: 4480b29433441c49607a67067923d325 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_XYZ

Return
-------
None

Description
-----------
Set the Center coordinates.
") SetCenter;
		void SetCenter(const gp_XYZ & theCenter);

		/****** Bnd_B3f::SetHSize ******/
		/****** md5 signature: 031cb1273b6bb49a7e7a82266bdf1e6b ******/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "
Parameters
----------
theHSize: gp_XYZ

Return
-------
None

Description
-----------
Set the HSize (half-diagonal) coordinates. All components of theHSize must be non-negative.
") SetHSize;
		void SetHSize(const gp_XYZ & theHSize);

		/****** Bnd_B3f::SquareExtent ******/
		/****** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
float

Description
-----------
Query the square diagonal. If the box is VOID (see method IsVoid()) then a very big real value is returned.
") SquareExtent;
		Standard_Real SquareExtent();

		/****** Bnd_B3f::Transformed ******/
		/****** md5 signature: 9b00f2708ad3e2a9b03868d6f3a16ca5 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
Bnd_B3f

Description
-----------
Transform the bounding box with the given transformation. The resulting box will be larger if theTrsf contains rotation.
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
		/****** Bnd_BoundSortBox::Bnd_BoundSortBox ******/
		/****** md5 signature: 432937775309e427743273a6bdbe335c ******/
		%feature("compactdefaultargs") Bnd_BoundSortBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty comparison algorithm for bounding boxes. The bounding boxes are then defined using the Initialize function.
") Bnd_BoundSortBox;
		 Bnd_BoundSortBox();

		/****** Bnd_BoundSortBox::Add ******/
		/****** md5 signature: c11cd3957b9f1b070bd4a139bc72cc6d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box
boxIndex: int

Return
-------
None

Description
-----------
Adds the bounding box theBox at position boxIndex in the array of boxes to be sorted by this comparison algorithm. This function is used only in conjunction with the third syntax described in the synopsis of Initialize. //! Exceptions: //! - Standard_OutOfRange if boxIndex is not in the range [ 1,nbComponents ] where nbComponents is the maximum number of bounding boxes declared for this comparison algorithm at initialization. //! - Standard_MultiplyDefined if a box already exists at position boxIndex in the array of boxes to be sorted by this comparison algorithm.
") Add;
		void Add(const Bnd_Box & theBox, const Standard_Integer boxIndex);

		/****** Bnd_BoundSortBox::Compare ******/
		/****** md5 signature: 69a2f5d307cbc61a4ae04451922de8ea ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
TColStd_ListOfInteger

Description
-----------
Compares the bounding box theBox, with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.
") Compare;
		const TColStd_ListOfInteger & Compare(const Bnd_Box & theBox);

		/****** Bnd_BoundSortBox::Compare ******/
		/****** md5 signature: bc068b36bfc32657d5d4d471cd5172bd ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln

Return
-------
TColStd_ListOfInteger

Description
-----------
Compares the plane P with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.
") Compare;
		const TColStd_ListOfInteger & Compare(const gp_Pln & P);

		/****** Bnd_BoundSortBox::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** Bnd_BoundSortBox::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** Bnd_BoundSortBox::Initialize ******/
		/****** md5 signature: dbb5dab5abfd063e114422a2e03ca032 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
CompleteBox: Bnd_Box
SetOfBox: Bnd_HArray1OfBox

Return
-------
None

Description
-----------
Initializes this comparison algorithm with - the set of bounding boxes SetOfBox.
") Initialize;
		void Initialize(const Bnd_Box & CompleteBox, const opencascade::handle<Bnd_HArray1OfBox> & SetOfBox);

		/****** Bnd_BoundSortBox::Initialize ******/
		/****** md5 signature: d9688715260aa4c9c4aebee632738183 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
SetOfBox: Bnd_HArray1OfBox

Return
-------
None

Description
-----------
Initializes this comparison algorithm with - the set of bounding boxes SetOfBox, where CompleteBox is given as the global bounding box of SetOfBox.
") Initialize;
		void Initialize(const opencascade::handle<Bnd_HArray1OfBox> & SetOfBox);

		/****** Bnd_BoundSortBox::Initialize ******/
		/****** md5 signature: 7b0c87c850b9c7ae88cab54c565bb25d ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
CompleteBox: Bnd_Box
nbComponents: int

Return
-------
None

Description
-----------
Initializes this comparison algorithm, giving it only - the maximum number nbComponents of the bounding boxes to be managed. Use the Add function to define the array of bounding boxes to be sorted by this algorithm.
") Initialize;
		void Initialize(const Bnd_Box & CompleteBox, const Standard_Integer nbComponents);

};


%extend Bnd_BoundSortBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class Bnd_Box *
****************/
class Bnd_Box {
	public:
		/****** Bnd_Box::Bnd_Box ******/
		/****** md5 signature: 1329baa12aa709d3897638f91bd6d327 ******/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Box. The constructed box is qualified Void. Its gap is null.
") Bnd_Box;
		 Bnd_Box();

		/****** Bnd_Box::Bnd_Box ******/
		/****** md5 signature: e97cf06d6d1b2ccd51edf64dd6ab76e2 ******/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "
Parameters
----------
theMin: gp_Pnt
theMax: gp_Pnt

Return
-------
None

Description
-----------
Creates a bounding box, it contains: - minimum/maximum point of bounding box, The constructed box is qualified Void. Its gap is null.
") Bnd_Box;
		 Bnd_Box(const gp_Pnt & theMin, const gp_Pnt & theMax);

		/****** Bnd_Box::Add ******/
		/****** md5 signature: f26c3b18c425c9af5e181dcf97365f7d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box

Return
-------
None

Description
-----------
Adds the box <Other> to <self>.
") Add;
		void Add(const Bnd_Box & Other);

		/****** Bnd_Box::Add ******/
		/****** md5 signature: b714bfb888eecda75b87221b873365bd ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Adds a Pnt to the box.
") Add;
		void Add(const gp_Pnt & P);

		/****** Bnd_Box::Add ******/
		/****** md5 signature: 7e55d9c284ce09cd4dd63f85011cde45 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
D: gp_Dir

Return
-------
None

Description
-----------
Extends <self> from the Pnt <P> in the direction <D>.
") Add;
		void Add(const gp_Pnt & P, const gp_Dir & D);

		/****** Bnd_Box::Add ******/
		/****** md5 signature: f5e67a29cde6a6d52768287ab5d77897 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir

Return
-------
None

Description
-----------
Extends the Box in the given Direction, i.e. adds an half-line. The box may become infinite in 1,2 or 3 directions.
") Add;
		void Add(const gp_Dir & D);

		/****** Bnd_Box::CornerMax ******/
		/****** md5 signature: ba66cc3b9f07809e242d6acf3b7b399a ******/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the upper corner of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid().
") CornerMax;
		gp_Pnt CornerMax();

		/****** Bnd_Box::CornerMin ******/
		/****** md5 signature: 986487b80ef67f31dfd8ba819cb4b46e ******/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the lower corner of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid().
") CornerMin;
		gp_Pnt CornerMin();

		/****** Bnd_Box::Distance ******/
		/****** md5 signature: 1a425f6da349f7a4118ac35c1d8396bd ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box

Return
-------
float

Description
-----------
Computes the minimum distance between two boxes.
") Distance;
		Standard_Real Distance(const Bnd_Box & Other);

		/****** Bnd_Box::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Bnd_Box::Enlarge ******/
		/****** md5 signature: b5dbc37ffece9eaee81e33bf3b715eef ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Enlarges the box with a tolerance value. (minvalues-Abs(<tol>) and maxvalues+Abs(<tol>)) This means that the minimum values of its X, Y and Z intervals of definition, when they are finite, are reduced by the absolute value of Tol, while the maximum values are increased by the same amount.
") Enlarge;
		void Enlarge(const Standard_Real Tol);

		/****** Bnd_Box::FinitePart ******/
		/****** md5 signature: b23462d45984e16bcf876321f08f3673 ******/
		%feature("compactdefaultargs") FinitePart;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Returns a finite part of an infinite bounding box (returns self if this is already finite box). This can be a Void box in case if its sides has been defined as infinite (Open) without adding any finite points. WARNING! This method relies on Open flags, the infinite points added using Add() method will be returned as is.
") FinitePart;
		Bnd_Box FinitePart();

		/****** Bnd_Box::Get ******/
		/****** md5 signature: fdcfde34f207fdeac6d324f55d7a58eb ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXmin: float
theYmin: float
theZmin: float
theXmax: float
theYmax: float
theZmax: float

Description
-----------
Returns the bounds of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid().
") Get;
		void Get(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Box::GetGap ******/
		/****** md5 signature: d6c52fd6b86efef444629668df8883f2 ******/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the gap of this bounding box.
") GetGap;
		Standard_Real GetGap();

		/****** Bnd_Box::HasFinitePart ******/
		/****** md5 signature: 6ad99adddd3d87ef1c65c750f8e0d220 ******/
		%feature("compactdefaultargs") HasFinitePart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this box has finite part.
") HasFinitePart;
		Standard_Boolean HasFinitePart();


        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** Bnd_Box::IsOpen ******/
		/****** md5 signature: 49b225479601710d1c8888cb2f18ffcf ******/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box has at least one open direction.
") IsOpen;
		Standard_Boolean IsOpen();

		/****** Bnd_Box::IsOpenXmax ******/
		/****** md5 signature: 5eb2255a5bab3f2bc582219e0faf64da ******/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Xmax direction.
") IsOpenXmax;
		Standard_Boolean IsOpenXmax();

		/****** Bnd_Box::IsOpenXmin ******/
		/****** md5 signature: 4a3ade2dd87cecd20ab6184f8ecaf60f ******/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Xmin direction.
") IsOpenXmin;
		Standard_Boolean IsOpenXmin();

		/****** Bnd_Box::IsOpenYmax ******/
		/****** md5 signature: 8d1ec673e6124a1b526a06e1d5a0cfcb ******/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Ymax direction.
") IsOpenYmax;
		Standard_Boolean IsOpenYmax();

		/****** Bnd_Box::IsOpenYmin ******/
		/****** md5 signature: 127e30414ce069b633717ba26051232c ******/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Ymix direction.
") IsOpenYmin;
		Standard_Boolean IsOpenYmin();

		/****** Bnd_Box::IsOpenZmax ******/
		/****** md5 signature: 0aeb25bdfc6d9155a40cd6f7296cd574 ******/
		%feature("compactdefaultargs") IsOpenZmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Zmax direction.
") IsOpenZmax;
		Standard_Boolean IsOpenZmax();

		/****** Bnd_Box::IsOpenZmin ******/
		/****** md5 signature: 5f71eec5d0881e37cb676487995acd94 ******/
		%feature("compactdefaultargs") IsOpenZmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Zmin direction.
") IsOpenZmin;
		Standard_Boolean IsOpenZmin();

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: f348a24dbf7e40c755152f8a70e3187a ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if the Pnt is out the box.
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt & P);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: 17652ecbd2ac3703da0006c5128dc63a ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
bool

Description
-----------
Returns False if the line intersects the box.
") IsOut;
		Standard_Boolean IsOut(const gp_Lin & L);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: 90ccbbde205392ec532b3171f3e59f37 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln

Return
-------
bool

Description
-----------
Returns False if the plane intersects the box.
") IsOut;
		Standard_Boolean IsOut(const gp_Pln & P);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: 80b9d1a0a52f6e56a8774d1bdf0ade38 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box

Return
-------
bool

Description
-----------
Returns False if the <Box> intersects or is inside <self>.
") IsOut;
		Standard_Boolean IsOut(const Bnd_Box & Other);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: 178d03e597d92d4cb58b27b941435df1 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box
T: gp_Trsf

Return
-------
bool

Description
-----------
Returns False if the transformed <Box> intersects or is inside <self>.
") IsOut;
		Standard_Boolean IsOut(const Bnd_Box & Other, const gp_Trsf & T);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: bc2c0188a7939d0ab743d2dd96d12728 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
T1: gp_Trsf
Other: Bnd_Box
T2: gp_Trsf

Return
-------
bool

Description
-----------
Returns False if the transformed <Box> intersects or is inside the transformed box <self>.
") IsOut;
		Standard_Boolean IsOut(const gp_Trsf & T1, const Bnd_Box & Other, const gp_Trsf & T2);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: d6a1e498867d5cdc9886a23004f4fd8c ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
D: gp_Dir

Return
-------
bool

Description
-----------
Returns False if the flat band lying between two parallel lines represented by their reference points <P1>, <P2> and direction <D> intersects the box.
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Dir & D);

		/****** Bnd_Box::IsThin ******/
		/****** md5 signature: 0254e00c3c2058c3088e4a3e19a6cd91 ******/
		%feature("compactdefaultargs") IsThin;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
bool

Description
-----------
Returns true if IsXThin, IsYThin and IsZThin are all true, i.e. if the box is thin in all three dimensions.
") IsThin;
		Standard_Boolean IsThin(const Standard_Real tol);

		/****** Bnd_Box::IsVoid ******/
		/****** md5 signature: 9aa2fb0e94327ea2b13fa6dbf2b30845 ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is empty (Void flag).
") IsVoid;
		Standard_Boolean IsVoid();

		/****** Bnd_Box::IsWhole ******/
		/****** md5 signature: 0a8318ed765ec359e07b16b26f838d8e ******/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is infinite in all 6 directions (WholeSpace flag).
") IsWhole;
		Standard_Boolean IsWhole();

		/****** Bnd_Box::IsXThin ******/
		/****** md5 signature: dad1e5627442e4703d7b7ad8e0c74cdb ******/
		%feature("compactdefaultargs") IsXThin;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
bool

Description
-----------
true if xmax-xmin < tol.
") IsXThin;
		Standard_Boolean IsXThin(const Standard_Real tol);

		/****** Bnd_Box::IsYThin ******/
		/****** md5 signature: 76bbc838755a83a7cd3d118ceea8aa53 ******/
		%feature("compactdefaultargs") IsYThin;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
bool

Description
-----------
true if ymax-ymin < tol.
") IsYThin;
		Standard_Boolean IsYThin(const Standard_Real tol);

		/****** Bnd_Box::IsZThin ******/
		/****** md5 signature: c4fcc02c36e9759b78c1ceb3680d1b99 ******/
		%feature("compactdefaultargs") IsZThin;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
bool

Description
-----------
true if zmax-zmin < tol.
") IsZThin;
		Standard_Boolean IsZThin(const Standard_Real tol);

		/****** Bnd_Box::OpenXmax ******/
		/****** md5 signature: 011b84ef137ac1ffb641f2c1a9ac63e2 ******/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Xmax direction.
") OpenXmax;
		void OpenXmax();

		/****** Bnd_Box::OpenXmin ******/
		/****** md5 signature: 0cb5023d1c04bb9f8d3afb0c66dc3550 ******/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Xmin direction.
") OpenXmin;
		void OpenXmin();

		/****** Bnd_Box::OpenYmax ******/
		/****** md5 signature: c73a2152a30be1e92daf823e7bff7593 ******/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Ymax direction.
") OpenYmax;
		void OpenYmax();

		/****** Bnd_Box::OpenYmin ******/
		/****** md5 signature: 4bcf368c4cb64b3755b7b035d5243c28 ******/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Ymin direction.
") OpenYmin;
		void OpenYmin();

		/****** Bnd_Box::OpenZmax ******/
		/****** md5 signature: d434332e53f7c60ae595a0a8a5d503ef ******/
		%feature("compactdefaultargs") OpenZmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Zmax direction.
") OpenZmax;
		void OpenZmax();

		/****** Bnd_Box::OpenZmin ******/
		/****** md5 signature: 91a795a7b168cc777c5c18df8e8b6cba ******/
		%feature("compactdefaultargs") OpenZmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Zmin direction.
") OpenZmin;
		void OpenZmin();

		/****** Bnd_Box::Set ******/
		/****** md5 signature: db883cf63ff497749765a1588d5f0509 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Sets this bounding box so that it bounds - the point P. This involves first setting this bounding box to be void and then adding the point P.
") Set;
		void Set(const gp_Pnt & P);

		/****** Bnd_Box::Set ******/
		/****** md5 signature: 945d824f108c7dfcd3451b159d172d3a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
D: gp_Dir

Return
-------
None

Description
-----------
Sets this bounding box so that it bounds the half-line defined by point P and direction D, i.e. all points M defined by M=P+u*D, where u is greater than or equal to 0, are inside the bounding volume. This involves first setting this box to be void and then adding the half-line.
") Set;
		void Set(const gp_Pnt & P, const gp_Dir & D);

		/****** Bnd_Box::SetGap ******/
		/****** md5 signature: 76801688da89431c55a524bd10939352 ******/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Set the gap of this bounding box to abs(Tol).
") SetGap;
		void SetGap(const Standard_Real Tol);

		/****** Bnd_Box::SetVoid ******/
		/****** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets this bounding box so that it is empty. All points are outside a void box.
") SetVoid;
		void SetVoid();

		/****** Bnd_Box::SetWhole ******/
		/****** md5 signature: a40c374c51cbe4a88447c330252451e9 ******/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets this bounding box so that it covers the whole of 3D space. It is infinitely long in all directions.
") SetWhole;
		void SetWhole();

		/****** Bnd_Box::SquareExtent ******/
		/****** md5 signature: 25897f4ea5ade71bb993b0f1c6520c54 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the squared diagonal of me.
") SquareExtent;
		Standard_Real SquareExtent();

		/****** Bnd_Box::Transformed ******/
		/****** md5 signature: f8f0492ba8a9ca40222a08025b8b8169 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
Bnd_Box

Description
-----------
Returns a bounding box which is the result of applying the transformation T to this bounding box. Warning Applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. This is not optimal for algorithms which use it.
") Transformed;
		Bnd_Box Transformed(const gp_Trsf & T);

		/****** Bnd_Box::Update ******/
		/****** md5 signature: c3930f0ed60b103221ac4d75e154bf2d ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aXmin: float
aYmin: float
aZmin: float
aXmax: float
aYmax: float
aZmax: float

Return
-------
None

Description
-----------
Enlarges this bounding box, if required, so that it contains at least: - interval [ aXmin,aXmax ] in the 'X Direction', - interval [ aYmin,aYmax ] in the 'Y Direction', - interval [ aZmin,aZmax ] in the 'Z Direction';.
") Update;
		void Update(const Standard_Real aXmin, const Standard_Real aYmin, const Standard_Real aZmin, const Standard_Real aXmax, const Standard_Real aYmax, const Standard_Real aZmax);

		/****** Bnd_Box::Update ******/
		/****** md5 signature: e8dbda4a342ab03c84b2e5bee720848f ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Adds a point of coordinates (X,Y,Z) to this bounding box.
") Update;
		void Update(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

};



%extend Bnd_Box {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Box {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Box()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Box')
    }
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
		/****** Bnd_Box2d::Bnd_Box2d ******/
		/****** md5 signature: 18bdb98247d9982c9bb8ed597d8523b6 ******/
		%feature("compactdefaultargs") Bnd_Box2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty 2D bounding box. The constructed box is qualified Void. Its gap is null.
") Bnd_Box2d;
		 Bnd_Box2d();

		/****** Bnd_Box2d::Add ******/
		/****** md5 signature: 6f044365f28f5f8cfea2a8ef87b5d3d8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the 2d box <Other> to <self>.
") Add;
		void Add(const Bnd_Box2d & Other);

		/****** Bnd_Box2d::Add ******/
		/****** md5 signature: 3345fd755af32d4addfbfcf462343566 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Adds the 2d point.
") Add;
		void Add(const gp_Pnt2d & thePnt);

		/****** Bnd_Box2d::Add ******/
		/****** md5 signature: 766d7f8bedbbfef7f57fba624ff81449 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d
theDir: gp_Dir2d

Return
-------
None

Description
-----------
Extends bounding box from thePnt in the direction theDir.
") Add;
		void Add(const gp_Pnt2d & thePnt, const gp_Dir2d & theDir);

		/****** Bnd_Box2d::Add ******/
		/****** md5 signature: 17bccdca6c22026d7b33e0b35baadcc7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir2d

Return
-------
None

Description
-----------
Extends the Box in the given Direction, i.e. adds a half-line. The box may become infinite in 1 or 2 directions.
") Add;
		void Add(const gp_Dir2d & D);

		/****** Bnd_Box2d::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** Bnd_Box2d::Enlarge ******/
		/****** md5 signature: d42b828f55c3eec07d633e1786debcb8 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
Enlarges the box with a tolerance value. This means that the minimum values of its X and Y intervals of definition, when they are finite, are reduced by the absolute value of Tol, while the maximum values are increased by the same amount.
") Enlarge;
		void Enlarge(const Standard_Real theTol);

		/****** Bnd_Box2d::Get ******/
		/****** md5 signature: 4f65ca439016927ed6232461d417c140 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------

Return
-------
aXmin: float
aYmin: float
aXmax: float
aYmax: float

Description
-----------
Returns the bounds of this 2D bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). if IsVoid().
") Get;
		void Get(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Box2d::GetGap ******/
		/****** md5 signature: 6750af4846e7c73d2306166a820dd5a3 ******/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the gap of this 2D bounding box.
") GetGap;
		Standard_Real GetGap();

		/****** Bnd_Box2d::IsOpenXmax ******/
		/****** md5 signature: 5eb2255a5bab3f2bc582219e0faf64da ******/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Xmax direction.
") IsOpenXmax;
		Standard_Boolean IsOpenXmax();

		/****** Bnd_Box2d::IsOpenXmin ******/
		/****** md5 signature: 4a3ade2dd87cecd20ab6184f8ecaf60f ******/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Xmin direction.
") IsOpenXmin;
		Standard_Boolean IsOpenXmin();

		/****** Bnd_Box2d::IsOpenYmax ******/
		/****** md5 signature: 8d1ec673e6124a1b526a06e1d5a0cfcb ******/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Ymax direction.
") IsOpenYmax;
		Standard_Boolean IsOpenYmax();

		/****** Bnd_Box2d::IsOpenYmin ******/
		/****** md5 signature: 127e30414ce069b633717ba26051232c ******/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Ymin direction.
") IsOpenYmin;
		Standard_Boolean IsOpenYmin();

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: d03cb9c8d7fe01e19de4b31ec8638b96 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if the 2d pnt <P> is out <self>.
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt2d & P);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: b38b06569c00369b03abed2049a1c3e3 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin2d

Return
-------
bool

Description
-----------
Returns True if the line doesn't intersect the box.
") IsOut;
		Standard_Boolean IsOut(const gp_Lin2d & theL);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: a23d5456f0cccf334434731d2ce66f73 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theP0: gp_Pnt2d
theP1: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if the segment doesn't intersect the box.
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt2d & theP0, const gp_Pnt2d & theP1);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: 76ce93721d21d2f47dd476b923763317 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box2d

Return
-------
bool

Description
-----------
Returns True if <Box2d> is out <self>.
") IsOut;
		Standard_Boolean IsOut(const Bnd_Box2d & Other);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: 242bdc5eb7d739c8e58bf1ccf125794e ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Box2d
theTrsf: gp_Trsf2d

Return
-------
bool

Description
-----------
Returns True if transformed <Box2d> is out <self>.
") IsOut;
		Standard_Boolean IsOut(const Bnd_Box2d & theOther, const gp_Trsf2d & theTrsf);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: 1de5bddfb807ee17935c8101289b1b30 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
T1: gp_Trsf2d
Other: Bnd_Box2d
T2: gp_Trsf2d

Return
-------
bool

Description
-----------
Compares a transformed bounding with a transformed bounding. The default implementation is to make a copy of <self> and <Other>, to transform them and to test.
") IsOut;
		Standard_Boolean IsOut(const gp_Trsf2d & T1, const Bnd_Box2d & Other, const gp_Trsf2d & T2);

		/****** Bnd_Box2d::IsVoid ******/
		/****** md5 signature: 9aa2fb0e94327ea2b13fa6dbf2b30845 ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this 2D bounding box is empty (Void flag).
") IsVoid;
		Standard_Boolean IsVoid();

		/****** Bnd_Box2d::IsWhole ******/
		/****** md5 signature: 0a8318ed765ec359e07b16b26f838d8e ******/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is infinite in all 4 directions (Whole Space flag).
") IsWhole;
		Standard_Boolean IsWhole();

		/****** Bnd_Box2d::OpenXmax ******/
		/****** md5 signature: 011b84ef137ac1ffb641f2c1a9ac63e2 ******/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Xmax direction.
") OpenXmax;
		void OpenXmax();

		/****** Bnd_Box2d::OpenXmin ******/
		/****** md5 signature: 0cb5023d1c04bb9f8d3afb0c66dc3550 ******/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Xmin direction.
") OpenXmin;
		void OpenXmin();

		/****** Bnd_Box2d::OpenYmax ******/
		/****** md5 signature: c73a2152a30be1e92daf823e7bff7593 ******/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Ymax direction.
") OpenYmax;
		void OpenYmax();

		/****** Bnd_Box2d::OpenYmin ******/
		/****** md5 signature: 4bcf368c4cb64b3755b7b035d5243c28 ******/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Ymin direction.
") OpenYmin;
		void OpenYmin();

		/****** Bnd_Box2d::Set ******/
		/****** md5 signature: 20e194d14a202c4fee73c68b1bd68f73 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Sets this 2D bounding box so that it bounds the point P. This involves first setting this bounding box to be void and then adding the point PThe rectangle bounds the point <P>.
") Set;
		void Set(const gp_Pnt2d & thePnt);

		/****** Bnd_Box2d::Set ******/
		/****** md5 signature: 3c944f7f0f286da9b8af1532b3c8f1d6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d
theDir: gp_Dir2d

Return
-------
None

Description
-----------
Sets this 2D bounding box so that it bounds the half-line defined by point P and direction D, i.e. all points M defined by M=P+u*D, where u is greater than or equal to 0, are inside the bounding area. This involves first setting this 2D box to be void and then adding the half-line.
") Set;
		void Set(const gp_Pnt2d & thePnt, const gp_Dir2d & theDir);

		/****** Bnd_Box2d::SetGap ******/
		/****** md5 signature: fd1e2e1d937f82e7bd6e34746a51db57 ******/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Set the gap of this 2D bounding box to abs(Tol).
") SetGap;
		void SetGap(const Standard_Real Tol);

		/****** Bnd_Box2d::SetVoid ******/
		/****** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets this 2D bounding box so that it is empty. All points are outside a void box.
") SetVoid;
		void SetVoid();

		/****** Bnd_Box2d::SetWhole ******/
		/****** md5 signature: a40c374c51cbe4a88447c330252451e9 ******/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets this bounding box so that it covers the whole 2D space, i.e. it is infinite in all directions.
") SetWhole;
		void SetWhole();

		/****** Bnd_Box2d::SquareExtent ******/
		/****** md5 signature: 25897f4ea5ade71bb993b0f1c6520c54 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the squared diagonal of me.
") SquareExtent;
		Standard_Real SquareExtent();

		/****** Bnd_Box2d::Transformed ******/
		/****** md5 signature: 9f68554d14860db57f14fcdad98487d8 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
Bnd_Box2d

Description
-----------
Returns a bounding box which is the result of applying the transformation T to this bounding box. Warning Applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. This is not optimal for algorithms which use it.
") Transformed;
		Bnd_Box2d Transformed(const gp_Trsf2d & T);

		/****** Bnd_Box2d::Update ******/
		/****** md5 signature: cbab599f6b79a58e1c4829eb37ff50ae ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aXmin: float
aYmin: float
aXmax: float
aYmax: float

Return
-------
None

Description
-----------
Enlarges this 2D bounding box, if required, so that it contains at least: - interval [ aXmin,aXmax ] in the 'X Direction', - interval [ aYmin,aYmax ] in the 'Y Direction'.
") Update;
		void Update(const Standard_Real aXmin, const Standard_Real aYmin, const Standard_Real aXmax, const Standard_Real aYmax);

		/****** Bnd_Box2d::Update ******/
		/****** md5 signature: 755b71c46d0e1aef441564ce8d7b156a ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float

Return
-------
None

Description
-----------
Adds a point of coordinates (X,Y) to this bounding box.
") Update;
		void Update(const Standard_Real X, const Standard_Real Y);

};



%extend Bnd_Box2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Box2d {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Box2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Box2d')
    }
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
		/****** Bnd_OBB::Bnd_OBB ******/
		/****** md5 signature: 89e871e268e0b019a1a62d73fd55eb19 ******/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Bnd_OBB;
		 Bnd_OBB();

		/****** Bnd_OBB::Bnd_OBB ******/
		/****** md5 signature: 9217a828a0fc36ef6ace41d448b130b0 ******/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theXDirection: gp_Dir
theYDirection: gp_Dir
theZDirection: gp_Dir
theHXSize: float
theHYSize: float
theHZSize: float

Return
-------
None

Description
-----------
Constructor taking all defining parameters.
") Bnd_OBB;
		 Bnd_OBB(const gp_Pnt & theCenter, const gp_Dir & theXDirection, const gp_Dir & theYDirection, const gp_Dir & theZDirection, const Standard_Real theHXSize, const Standard_Real theHYSize, const Standard_Real theHZSize);

		/****** Bnd_OBB::Bnd_OBB ******/
		/****** md5 signature: 5c80c49300d6c6d28ac3791ffa9f9dfb ******/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
None

Description
-----------
Constructor to create OBB from AABB.
") Bnd_OBB;
		 Bnd_OBB(const Bnd_Box & theBox);

		/****** Bnd_OBB::Add ******/
		/****** md5 signature: 1f61a26817c8d333e27dfcdd5e33f7c7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_OBB

Return
-------
None

Description
-----------
Rebuilds this in order to include all previous objects (which it was created from) and theOther.
") Add;
		void Add(const Bnd_OBB & theOther);

		/****** Bnd_OBB::Add ******/
		/****** md5 signature: 67fb36a9dbd11d4528c03db6f935bcb9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Rebuilds this in order to include all previous objects (which it was created from) and theP.
") Add;
		void Add(const gp_Pnt & theP);

		/****** Bnd_OBB::Center ******/
		/****** md5 signature: 46cca58f8b29223ae05354ea8a3e5417 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the center of OBB.
") Center;
		const gp_XYZ Center();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Bnd_OBB::Enlarge ******/
		/****** md5 signature: d759fcc6f239218e61510f561f9d7a30 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theGapAdd: float

Return
-------
None

Description
-----------
Enlarges the box with the given value.
") Enlarge;
		void Enlarge(const Standard_Real theGapAdd);

		/****** Bnd_OBB::GetVertex ******/
		/****** md5 signature: dd70008164910fd933486ee1e89b66ea ******/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns the array of vertices in <this>. The local coordinate of the vertex depending on the index of the array are follow: Index == 0: (-XHSize(), -YHSize(), -ZHSize()) Index == 1: ( XHSize(), -YHSize(), -ZHSize()) Index == 2: (-XHSize(), YHSize(), -ZHSize()) Index == 3: ( XHSize(), YHSize(), -ZHSize()) Index == 4: (-XHSize(), -YHSize(), ZHSize()) Index == 5: ( XHSize(), -YHSize(), ZHSize()) Index == 6: (-XHSize(), YHSize(), ZHSize()) Index == 7: ( XHSize(), YHSize(), ZHSize()).
") GetVertex;
		Standard_Boolean GetVertex(gp_Pnt theP[8]);

		/****** Bnd_OBB::IsAABox ******/
		/****** md5 signature: 7148a9fa3dfaccda890cea457298eb25 ******/
		%feature("compactdefaultargs") IsAABox;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the box is axes aligned.
") IsAABox;
		Standard_Boolean IsAABox();

		/****** Bnd_OBB::IsCompletelyInside ******/
		/****** md5 signature: 148285a41cd36b32b1b047410e1cb231 ******/
		%feature("compactdefaultargs") IsCompletelyInside;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_OBB

Return
-------
bool

Description
-----------
Check if the theOther is completely inside *this.
") IsCompletelyInside;
		Standard_Boolean IsCompletelyInside(const Bnd_OBB & theOther);

		/****** Bnd_OBB::IsOut ******/
		/****** md5 signature: 3095c5adc40292ad8ea01e1ff6f5e59c ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_OBB

Return
-------
bool

Description
-----------
Check if the box do not interfere the other box.
") IsOut;
		Standard_Boolean IsOut(const Bnd_OBB & theOther);

		/****** Bnd_OBB::IsOut ******/
		/****** md5 signature: 228da6a39bbd69e9e6af11076e8f64ec ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Check if the point is inside of <this>.
") IsOut;
		Standard_Boolean IsOut(const gp_Pnt & theP);

		/****** Bnd_OBB::IsVoid ******/
		/****** md5 signature: 9aa2fb0e94327ea2b13fa6dbf2b30845 ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the box is empty.
") IsVoid;
		Standard_Boolean IsVoid();

		/****** Bnd_OBB::Position ******/
		/****** md5 signature: abac85ad2868eb73ea9b953e87e8f5a6 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of this oriented box. So that applying it to axis-aligned box ((-XHSize, -YHSize, -ZHSize), (XHSize, YHSize, ZHSize)) will produce this oriented box. @code gp_Trsf aLoc; aLoc.SetTransformation (theOBB.Position(), gp::XOY()); @endcode.
") Position;
		gp_Ax3 Position();

		/****** Bnd_OBB::ReBuild ******/
		/****** md5 signature: acf5bcc5aed4bfb9e587af3a3f44a66c ******/
		%feature("compactdefaultargs") ReBuild;
		%feature("autodoc", "
Parameters
----------
theListOfPoints: TColgp_Array1OfPnt
theListOfTolerances: TColStd_Array1OfReal * (optional, default to 0)
theIsOptimal: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates new OBB covering every point in theListOfPoints. Tolerance of every such point is set by *theListOfTolerances array. If this array is not void (not null-pointer) then the resulted Bnd_OBB will be enlarged using tolerances of points lying on the box surface. <theIsOptimal> flag defines the mode in which the OBB will be built. Constructing Optimal box takes more time, but the resulting box is usually more tight. In case of construction of Optimal OBB more possible axes are checked.
") ReBuild;
		void ReBuild(const TColgp_Array1OfPnt & theListOfPoints, const TColStd_Array1OfReal * theListOfTolerances = 0, const Standard_Boolean theIsOptimal = Standard_False);

		/****** Bnd_OBB::SetAABox ******/
		/****** md5 signature: 5682f586345a83106e4cd6132b55253e ******/
		%feature("compactdefaultargs") SetAABox;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Sets the flag for axes aligned box.
") SetAABox;
		void SetAABox(const Standard_Boolean & theFlag);

		/****** Bnd_OBB::SetCenter ******/
		/****** md5 signature: ecf3b6f0e545b80cc6040218013c7da9 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt

Return
-------
None

Description
-----------
Sets the center of OBB.
") SetCenter;
		void SetCenter(const gp_Pnt & theCenter);

		/****** Bnd_OBB::SetVoid ******/
		/****** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears this box.
") SetVoid;
		void SetVoid();

		/****** Bnd_OBB::SetXComponent ******/
		/****** md5 signature: 3fd434ed4f088b8cf0c305d42d7f8a32 ******/
		%feature("compactdefaultargs") SetXComponent;
		%feature("autodoc", "
Parameters
----------
theXDirection: gp_Dir
theHXSize: float

Return
-------
None

Description
-----------
Sets the X component of OBB - direction and size.
") SetXComponent;
		void SetXComponent(const gp_Dir & theXDirection, const Standard_Real theHXSize);

		/****** Bnd_OBB::SetYComponent ******/
		/****** md5 signature: 1d3f648489c5c7522cfa155c34eb06c8 ******/
		%feature("compactdefaultargs") SetYComponent;
		%feature("autodoc", "
Parameters
----------
theYDirection: gp_Dir
theHYSize: float

Return
-------
None

Description
-----------
Sets the Y component of OBB - direction and size.
") SetYComponent;
		void SetYComponent(const gp_Dir & theYDirection, const Standard_Real theHYSize);

		/****** Bnd_OBB::SetZComponent ******/
		/****** md5 signature: 066b299320bec5e6edce21a4bec1a6dd ******/
		%feature("compactdefaultargs") SetZComponent;
		%feature("autodoc", "
Parameters
----------
theZDirection: gp_Dir
theHZSize: float

Return
-------
None

Description
-----------
Sets the Z component of OBB - direction and size.
") SetZComponent;
		void SetZComponent(const gp_Dir & theZDirection, const Standard_Real theHZSize);

		/****** Bnd_OBB::SquareExtent ******/
		/****** md5 signature: 25897f4ea5ade71bb993b0f1c6520c54 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns square diagonal of this box.
") SquareExtent;
		Standard_Real SquareExtent();

		/****** Bnd_OBB::XDirection ******/
		/****** md5 signature: 0a83cc2971cb7167c60ad6b3d7dca376 ******/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the X Direction of OBB.
") XDirection;
		const gp_XYZ XDirection();

		/****** Bnd_OBB::XHSize ******/
		/****** md5 signature: 526802efb4402c85f127c7018b567c47 ******/
		%feature("compactdefaultargs") XHSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the X Dimension of OBB.
") XHSize;
		Standard_Real XHSize();

		/****** Bnd_OBB::YDirection ******/
		/****** md5 signature: 744e806c5058127dad2ce76fc00590ec ******/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the Y Direction of OBB.
") YDirection;
		const gp_XYZ YDirection();

		/****** Bnd_OBB::YHSize ******/
		/****** md5 signature: 6d522f889ae8adf72911e2195e043099 ******/
		%feature("compactdefaultargs") YHSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Y Dimension of OBB.
") YHSize;
		Standard_Real YHSize();

		/****** Bnd_OBB::ZDirection ******/
		/****** md5 signature: 27b712f9ed3424a7a71c33e6948ec3cc ******/
		%feature("compactdefaultargs") ZDirection;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the Z Direction of OBB.
") ZDirection;
		const gp_XYZ ZDirection();

		/****** Bnd_OBB::ZHSize ******/
		/****** md5 signature: 5638a8c206b8e411b11abbef19373825 ******/
		%feature("compactdefaultargs") ZHSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Z Dimension of OBB.
") ZHSize;
		Standard_Real ZHSize();

};



%extend Bnd_OBB {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_OBB {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_OBB()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_OBB')
    }
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
		/****** Bnd_Range::Bnd_Range ******/
		/****** md5 signature: c4e1ef542ad0477e9971285d75047d7d ******/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor. Creates VOID range.
") Bnd_Range;
		 Bnd_Range();

		/****** Bnd_Range::Bnd_Range ******/
		/****** md5 signature: 39d4d1bfbab659fc681a5eaf9d4bcdd7 ******/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "
Parameters
----------
theMin: float
theMax: float

Return
-------
None

Description
-----------
Constructor. Never creates VOID range.
") Bnd_Range;
		 Bnd_Range(const Standard_Real theMin, const Standard_Real theMax);

		/****** Bnd_Range::Add ******/
		/****** md5 signature: b9e6176b78191d36c23b46360c711cd9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theParameter: float

Return
-------
None

Description
-----------
Extends <this> to include theParameter.
") Add;
		void Add(const Standard_Real theParameter);

		/****** Bnd_Range::Add ******/
		/****** md5 signature: 49550d5c240c310670e3adabff0f2431 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theRange: Bnd_Range

Return
-------
None

Description
-----------
Extends this range to include both ranges. 
See also: use method ::Union() to check if two ranges overlap method merging.
") Add;
		void Add(const Bnd_Range & theRange);

		/****** Bnd_Range::Common ******/
		/****** md5 signature: 9f5a37a4e8b0025ffc11bc0d0f8c7cd1 ******/
		%feature("compactdefaultargs") Common;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Range

Return
-------
None

Description
-----------
Replaces <this> with common-part of <this> and theOther.
") Common;
		void Common(const Bnd_Range & theOther);

		/****** Bnd_Range::Delta ******/
		/****** md5 signature: e52c84a425b733662cba593f9fa45ed5 ******/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns range value (MAX-MIN). Returns negative value for VOID range.
") Delta;
		Standard_Real Delta();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Bnd_Range::Enlarge ******/
		/****** md5 signature: 2c37569c59dcd99db9a5ddf54944897c ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theDelta: float

Return
-------
None

Description
-----------
Extends this to the given value (in both side).
") Enlarge;
		void Enlarge(const Standard_Real theDelta);

		/****** Bnd_Range::GetBounds ******/
		/****** md5 signature: aa339ecf3a64a71836ac94404be96f14 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
theFirstPar: float
theLastPar: float

Description
-----------
Obtain first and last boundary of <this>. If <this> is VOID the method returns false.
") GetBounds;
		Standard_Boolean GetBounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Range::GetIntermediatePoint ******/
		/****** md5 signature: c6225a019c036447a5a4ba58a34915ea ******/
		%feature("compactdefaultargs") GetIntermediatePoint;
		%feature("autodoc", "
Parameters
----------
theLambda: float

Return
-------
theParameter: float

Description
-----------
Obtain theParameter satisfied to the equation (theParameter-MIN)/(MAX-MIN) == theLambda. * theLambda == 0 --> MIN boundary will be returned; * theLambda == 0.5 --> Middle point will be returned; * theLambda == 1 --> MAX boundary will be returned; * theLambda < 0 --> the value less than MIN will be returned; * theLambda > 1 --> the value greater than MAX will be returned. If <this> is VOID the method returns false.
") GetIntermediatePoint;
		Standard_Boolean GetIntermediatePoint(const Standard_Real theLambda, Standard_Real &OutValue);

		/****** Bnd_Range::GetMax ******/
		/****** md5 signature: 5d8b155ad152e8e5b0e41b224ac467a0 ******/
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "
Parameters
----------

Return
-------
thePar: float

Description
-----------
Obtain MAX boundary of <this>. If <this> is VOID the method returns false.
") GetMax;
		Standard_Boolean GetMax(Standard_Real &OutValue);

		/****** Bnd_Range::GetMin ******/
		/****** md5 signature: 074bd660b5e6316ea49fb8983bf41670 ******/
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "
Parameters
----------

Return
-------
thePar: float

Description
-----------
Obtain MIN boundary of <this>. If <this> is VOID the method returns false.
") GetMin;
		Standard_Boolean GetMin(Standard_Real &OutValue);

		/****** Bnd_Range::IsIntersected ******/
		/****** md5 signature: 123db05445d1a166445329a30c97e68b ******/
		%feature("compactdefaultargs") IsIntersected;
		%feature("autodoc", "
Parameters
----------
theVal: float
thePeriod: float (optional, default to 0.0)

Return
-------
int

Description
-----------
Checks if <this> intersects values like theVal+k*thePeriod, where k is an integer number (k = 0, +/-1, +/-2, ...). Returns: 0 - if <this> does not intersect the theVal+k*thePeriod. 1 - if <this> intersects theVal+k*thePeriod. 2 - if myFirst or/and myLast are equal to theVal+k*thePeriod. //! ATTENTION!!! If (myFirst == myLast) then this function will return only either 0 or 2.
") IsIntersected;
		Standard_Integer IsIntersected(const Standard_Real theVal, const Standard_Real thePeriod = 0.0);

		/****** Bnd_Range::IsOut ******/
		/****** md5 signature: 92f904495367c13bf088bf6ede0d150a ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
bool

Description
-----------
Returns True if the value is out of this range.
") IsOut;
		Standard_Boolean IsOut(Standard_Real theValue);

		/****** Bnd_Range::IsOut ******/
		/****** md5 signature: a06de79ff8a89a245c86f2e37b66f2ce ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theRange: Bnd_Range

Return
-------
bool

Description
-----------
Returns True if the given range is out of this range.
") IsOut;
		Standard_Boolean IsOut(const Bnd_Range & theRange);

		/****** Bnd_Range::IsVoid ******/
		/****** md5 signature: 9aa2fb0e94327ea2b13fa6dbf2b30845 ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is <this> initialized.
") IsVoid;
		Standard_Boolean IsVoid();

		/****** Bnd_Range::SetVoid ******/
		/****** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes <this> by default parameters. Makes <this> VOID.
") SetVoid;
		void SetVoid();

		/****** Bnd_Range::Shift ******/
		/****** md5 signature: ed2755c188238cd9b289703de65e61c2 ******/
		%feature("compactdefaultargs") Shift;
		%feature("autodoc", "
Parameters
----------
theVal: float

Return
-------
None

Description
-----------
Shifts <*this> by theVal.
") Shift;
		void Shift(const Standard_Real theVal);

		/****** Bnd_Range::Shifted ******/
		/****** md5 signature: ec2717e15f9fbc7fbbdfc0a45ff5d722 ******/
		%feature("compactdefaultargs") Shifted;
		%feature("autodoc", "
Parameters
----------
theVal: float

Return
-------
Bnd_Range

Description
-----------
Returns the copy of <*this> shifted by theVal.
") Shifted;
		Bnd_Range Shifted(const Standard_Real theVal);

		/****** Bnd_Range::Split ******/
		/****** md5 signature: 0590e3e907e57ad90c413cd74383099a ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
theVal: float
theList: NCollection_List<Bnd_Range>
thePeriod: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Splits <this> to several sub-ranges by theVal value (e.g. range [3, 15] will be split by theVal==5 to the two ranges: [3, 5] and [5, 15]). New ranges will be pushed to theList (theList must be initialized correctly before calling this method). If thePeriod != 0.0 then at least one boundary of new ranges (if <*this> intersects theVal+k*thePeriod) will be equal to theVal+thePeriod*k, where k is an integer number (k = 0, +/-1, +/-2, ...). (let thePeriod in above example be 4 ==> we will obtain four ranges: [3, 5], [5, 9], [9, 13] and [13, 15].
") Split;
		void Split(const Standard_Real theVal, NCollection_List<Bnd_Range> & theList, const Standard_Real thePeriod = 0.0);

		/****** Bnd_Range::TrimFrom ******/
		/****** md5 signature: 5c6dae4ea6e830ab5b0c80e8f5a7f485 ******/
		%feature("compactdefaultargs") TrimFrom;
		%feature("autodoc", "
Parameters
----------
theValLower: float

Return
-------
None

Description
-----------
Trims the First value in range by the given lower limit. Marks range as Void if the given Lower value is greater than range Max.
") TrimFrom;
		void TrimFrom(const Standard_Real theValLower);

		/****** Bnd_Range::TrimTo ******/
		/****** md5 signature: aa2a091d624f5f01b4647b1374ab8df0 ******/
		%feature("compactdefaultargs") TrimTo;
		%feature("autodoc", "
Parameters
----------
theValUpper: float

Return
-------
None

Description
-----------
Trim the Last value in range by the given Upper limit. Marks range as Void if the given Upper value is smaller than range Max.
") TrimTo;
		void TrimTo(const Standard_Real theValUpper);

		/****** Bnd_Range::Union ******/
		/****** md5 signature: a12c3e67aa639d72862c6a3a201b7784 ******/
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Range

Return
-------
bool

Description
-----------
Joins *this and theOther to one interval. Replaces *this to the result. Returns false if the operation cannot be done (e.g. input arguments are empty or separated). 
See also: use method ::Add() to merge two ranges unconditionally.
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
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Range {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Range()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Range')
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
		/****** Bnd_Sphere::Bnd_Sphere ******/
		/****** md5 signature: c7419981813f88f5869f6cf8e039de21 ******/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Bnd_Sphere;
		 Bnd_Sphere();

		/****** Bnd_Sphere::Bnd_Sphere ******/
		/****** md5 signature: c3f8a006c1c390e8f88e5d3c045ceb48 ******/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "
Parameters
----------
theCntr: gp_XYZ
theRad: float
theU: int
theV: int

Return
-------
None

Description
-----------
Constructor of a definite sphere.
") Bnd_Sphere;
		 Bnd_Sphere(const gp_XYZ & theCntr, const Standard_Real theRad, const Standard_Integer theU, const Standard_Integer theV);

		/****** Bnd_Sphere::Add ******/
		/****** md5 signature: e63556631cbf2ba437d3318f36771c8b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const Bnd_Sphere & theOther);

		/****** Bnd_Sphere::Center ******/
		/****** md5 signature: c0f204842bb3fee8d6fd43ddb0e66ea1 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns center of sphere object.
") Center;
		const gp_XYZ Center();

		/****** Bnd_Sphere::Distance ******/
		/****** md5 signature: a56aeb5272160f8dff3400c26d338428 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theNode: gp_XYZ

Return
-------
float

Description
-----------
No available documentation.
") Distance;
		Standard_Real Distance(const gp_XYZ & theNode);

		/****** Bnd_Sphere::Distances ******/
		/****** md5 signature: 50de2161c1d914223675c67632adce8e ******/
		%feature("compactdefaultargs") Distances;
		%feature("autodoc", "
Parameters
----------
theXYZ: gp_XYZ

Return
-------
theMin: float
theMax: float

Description
-----------
Calculate and return minimal and maximal distance to sphere. NOTE: This function is tightly optimized; any modifications may affect performance!.
") Distances;
		void Distances(const gp_XYZ & theXYZ, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Sphere::IsOut ******/
		/****** md5 signature: 58212268d92d4726dde0412ccb4e0901 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Sphere

Return
-------
bool

Description
-----------
No available documentation.
") IsOut;
		Standard_Boolean IsOut(const Bnd_Sphere & theOther);

		/****** Bnd_Sphere::IsOut ******/
		/****** md5 signature: 0960ab8022e734d37aad310b0486e970 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ

Return
-------
theMaxDist: float

Description
-----------
No available documentation.
") IsOut;
		Standard_Boolean IsOut(const gp_XYZ & thePnt, Standard_Real &OutValue);

		/****** Bnd_Sphere::IsValid ******/
		/****** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns validity status, indicating that this sphere corresponds to a real entity.
") IsValid;
		Standard_Boolean IsValid();

		/****** Bnd_Sphere::Project ******/
		/****** md5 signature: afce8f38342e2faa636831f45756a1f8 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
theNode: gp_XYZ
theProjNode: gp_XYZ

Return
-------
theDist: float
theInside: bool

Description
-----------
Projects a point on entity. Returns true if success.
") Project;
		Standard_Boolean Project(const gp_XYZ & theNode, gp_XYZ & theProjNode, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****** Bnd_Sphere::Radius ******/
		/****** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the radius value.
") Radius;
		Standard_Real Radius();

		/****** Bnd_Sphere::SetValid ******/
		/****** md5 signature: 027a3b33b6159b61ed6210ad45f0f977 ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
isValid: bool

Return
-------
None

Description
-----------
No available documentation.
") SetValid;
		void SetValid(const Standard_Boolean isValid);

		/****** Bnd_Sphere::SquareDistance ******/
		/****** md5 signature: 44a8f70b9596aee83a101854ca831bdd ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theNode: gp_XYZ

Return
-------
float

Description
-----------
No available documentation.
") SquareDistance;
		Standard_Real SquareDistance(const gp_XYZ & theNode);

		/****** Bnd_Sphere::SquareDistances ******/
		/****** md5 signature: 0115354ec7c961d10a14dc6ca650e8d9 ******/
		%feature("compactdefaultargs") SquareDistances;
		%feature("autodoc", "
Parameters
----------
theXYZ: gp_XYZ

Return
-------
theMin: float
theMax: float

Description
-----------
Calculate and return minimal and maximal distance to sphere. NOTE: This function is tightly optimized; any modifications may affect performance!.
") SquareDistances;
		void SquareDistances(const gp_XYZ & theXYZ, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Sphere::SquareExtent ******/
		/****** md5 signature: f26f4f9c0289ab73c82a48183db937a6 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") SquareExtent;
		Standard_Real SquareExtent();

		/****** Bnd_Sphere::U ******/
		/****** md5 signature: 4386b8f210f0e77f0b54d3c67203a6aa ******/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the U parameter on shape.
") U;
		Standard_Integer U();

		/****** Bnd_Sphere::V ******/
		/****** md5 signature: ec40bf56ed7e6d7231afb79a2fb7ca46 ******/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the V parameter on shape.
") V;
		Standard_Integer V();

};



%extend Bnd_Sphere {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Sphere {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Sphere()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Sphere')
    }
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
		/****** Bnd_Tools::Bnd2BVH ******/
		/****** md5 signature: cb874faf532c5f417d96e7f24657756b ******/
		%feature("compactdefaultargs") Bnd2BVH;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box2d

Return
-------
BVH_Box<float, 2 >

Description
-----------
Converts the given Bnd_Box2d to BVH_Box.
") Bnd2BVH;
		static BVH_Box<Standard_Real, 2 > Bnd2BVH(const Bnd_Box2d & theBox);

		/****** Bnd_Tools::Bnd2BVH ******/
		/****** md5 signature: 91eae1d8889c489de53fa29abb792a4c ******/
		%feature("compactdefaultargs") Bnd2BVH;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
BVH_Box<float, 3 >

Description
-----------
Converts the given Bnd_Box to BVH_Box.
") Bnd2BVH;
		static BVH_Box<Standard_Real, 3 > Bnd2BVH(const Bnd_Box & theBox);

};



%extend Bnd_Tools {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Tools {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Tools()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Tools')
    }
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


class Bnd_HArray1OfBox2d : public Bnd_Array1OfBox2d, public Standard_Transient {
  public:
    Bnd_HArray1OfBox2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfBox2d(const Standard_Integer theLower, const Standard_Integer theUpper, const Bnd_Array1OfBox2d::value_type& theValue);
    Bnd_HArray1OfBox2d(const Bnd_Array1OfBox2d& theOther);
    const Bnd_Array1OfBox2d& Array1();
    Bnd_Array1OfBox2d& ChangeArray1();
};
%make_alias(Bnd_HArray1OfBox2d)


class Bnd_HArray1OfSphere : public Bnd_Array1OfSphere, public Standard_Transient {
  public:
    Bnd_HArray1OfSphere(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfSphere(const Standard_Integer theLower, const Standard_Integer theUpper, const Bnd_Array1OfSphere::value_type& theValue);
    Bnd_HArray1OfSphere(const Bnd_Array1OfSphere& theOther);
    const Bnd_Array1OfSphere& Array1();
    Bnd_Array1OfSphere& ChangeArray1();
};
%make_alias(Bnd_HArray1OfSphere)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Bnd_Tools_Bnd2BVH(*args):
	return Bnd_Tools.Bnd2BVH(*args)

@deprecated
def Bnd_Tools_Bnd2BVH(*args):
	return Bnd_Tools.Bnd2BVH(*args)

}
