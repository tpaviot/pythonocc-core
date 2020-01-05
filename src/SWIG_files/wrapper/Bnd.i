/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(Bnd_HArray1OfBox)
%wrap_handle(Bnd_HArray1OfSphere)
%wrap_handle(Bnd_HArray1OfBox2d)
/* end handles declaration */

/* templates */
%template(Bnd_Array1OfSphere) NCollection_Array1 <Bnd_Sphere>;

%extend NCollection_Array1 <Bnd_Sphere> {
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
%template(Bnd_Array1OfBox) NCollection_Array1 <Bnd_Box>;

%extend NCollection_Array1 <Bnd_Box> {
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
%template(Bnd_Array1OfBox2d) NCollection_Array1 <Bnd_Box2d>;

%extend NCollection_Array1 <Bnd_Box2d> {
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
%template(Bnd_SeqOfBox) NCollection_Sequence <Bnd_Box>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <Bnd_Sphere> Bnd_Array1OfSphere;
typedef NCollection_Array1 <Bnd_Box> Bnd_Array1OfBox;
typedef NCollection_Array1 <Bnd_Box2d> Bnd_Array1OfBox2d;
typedef NCollection_Sequence <Bnd_Box> Bnd_SeqOfBox;
/* end typedefs declaration */

/****************
* class Bnd_B2d *
****************/
class Bnd_B2d {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by a point.
	:param thePnt:
	:type thePnt: gp_XY
	:rtype: None") Add;
		void Add (const gp_XY & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by a point.
	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None") Add;
		void Add (const gp_Pnt2d & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by another box.
	:param theBox:
	:type theBox: Bnd_B2d
	:rtype: None") Add;
		void Add (const Bnd_B2d & theBox);

		/****************** Bnd_B2d ******************/
		%feature("compactdefaultargs") Bnd_B2d;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Bnd_B2d;
		 Bnd_B2d ();

		/****************** Bnd_B2d ******************/
		%feature("compactdefaultargs") Bnd_B2d;
		%feature("autodoc", "* Constructor.
	:param theCenter:
	:type theCenter: gp_XY
	:param theHSize:
	:type theHSize: gp_XY
	:rtype: None") Bnd_B2d;
		 Bnd_B2d (const gp_XY & theCenter,const gp_XY & theHSize);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Reset the box data.
	:rtype: None") Clear;
		void Clear ();

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "* Query a box corner: (Center + HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
	:rtype: gp_XY") CornerMax;
		gp_XY CornerMax ();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "* Query a box corner: (Center - HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
	:rtype: gp_XY") CornerMin;
		gp_XY CornerMin ();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "* Extend the Box by the absolute value of theDiff.
	:param theDiff:
	:type theDiff: float
	:rtype: None") Enlarge;
		void Enlarge (const Standard_Real theDiff);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Check that the box 'this' is inside the given box 'theBox'. Returns True if 'this' box is fully inside 'theBox'.
	:param theBox:
	:type theBox: Bnd_B2d
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const Bnd_B2d & theBox);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Check that the box 'this' is inside the given box 'theBox' transformed by 'theTrsf'. Returns True if 'this' box is fully inside the transformed 'theBox'.
	:param theBox:
	:type theBox: Bnd_B2d
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const Bnd_B2d & theBox,const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given point for the inclusion in the Box. Returns True if the point is outside.
	:param thePnt:
	:type thePnt: gp_XY
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XY & thePnt);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check a circle for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theCenter:
	:type theCenter: gp_XY
	:param theRadius:
	:type theRadius: float
	:param isCircleHollow: default value is Standard_False
	:type isCircleHollow: bool
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XY & theCenter,const Standard_Real theRadius,const Standard_Boolean isCircleHollow = Standard_False);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given box for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theOtherBox:
	:type theOtherBox: Bnd_B2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_B2d & theOtherBox);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given box oriented by the given transformation for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theOtherBox:
	:type theOtherBox: Bnd_B2d
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_B2d & theOtherBox,const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given Line for the intersection with the current box. Returns True if there is no intersection.
	:param theLine:
	:type theLine: gp_Ax2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Ax2d & theLine);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the Segment defined by the couple of input points for the intersection with the current box. Returns True if there is no intersection.
	:param theP0:
	:type theP0: gp_XY
	:param theP1:
	:type theP1: gp_XY
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XY & theP0,const gp_XY & theP1);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Returns True if the box is void (non-initialized).
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid ();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "* Limit the Box by the internals of theOtherBox. Returns True if the limitation takes place, otherwise False indicating that the boxes do not intersect.
	:param theOtherBox:
	:type theOtherBox: Bnd_B2d
	:rtype: bool") Limit;
		Standard_Boolean Limit (const Bnd_B2d & theOtherBox);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "* Set the Center coordinates
	:param theCenter:
	:type theCenter: gp_XY
	:rtype: None") SetCenter;
		void SetCenter (const gp_XY & theCenter);

		/****************** SetHSize ******************/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "* Set the HSize (half-diagonal) coordinates. All components of theHSize must be non-negative.
	:param theHSize:
	:type theHSize: gp_XY
	:rtype: None") SetHSize;
		void SetHSize (const gp_XY & theHSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "* Query the square diagonal. If the box is VOID (see method IsVoid()) then a very big real value is returned.
	:rtype: float") SquareExtent;
		Standard_Real SquareExtent ();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transform the bounding box with the given transformation. The resulting box will be larger if theTrsf contains rotation.
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: Bnd_B2d") Transformed;
		Bnd_B2d Transformed (const gp_Trsf2d & theTrsf);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by a point.
	:param thePnt:
	:type thePnt: gp_XY
	:rtype: None") Add;
		void Add (const gp_XY & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by a point.
	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None") Add;
		void Add (const gp_Pnt2d & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by another box.
	:param theBox:
	:type theBox: Bnd_B2f
	:rtype: None") Add;
		void Add (const Bnd_B2f & theBox);

		/****************** Bnd_B2f ******************/
		%feature("compactdefaultargs") Bnd_B2f;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Bnd_B2f;
		 Bnd_B2f ();

		/****************** Bnd_B2f ******************/
		%feature("compactdefaultargs") Bnd_B2f;
		%feature("autodoc", "* Constructor.
	:param theCenter:
	:type theCenter: gp_XY
	:param theHSize:
	:type theHSize: gp_XY
	:rtype: None") Bnd_B2f;
		 Bnd_B2f (const gp_XY & theCenter,const gp_XY & theHSize);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Reset the box data.
	:rtype: None") Clear;
		void Clear ();

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "* Query a box corner: (Center + HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
	:rtype: gp_XY") CornerMax;
		gp_XY CornerMax ();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "* Query a box corner: (Center - HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
	:rtype: gp_XY") CornerMin;
		gp_XY CornerMin ();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "* Extend the Box by the absolute value of theDiff.
	:param theDiff:
	:type theDiff: float
	:rtype: None") Enlarge;
		void Enlarge (const Standard_Real theDiff);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Check that the box 'this' is inside the given box 'theBox'. Returns True if 'this' box is fully inside 'theBox'.
	:param theBox:
	:type theBox: Bnd_B2f
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const Bnd_B2f & theBox);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Check that the box 'this' is inside the given box 'theBox' transformed by 'theTrsf'. Returns True if 'this' box is fully inside the transformed 'theBox'.
	:param theBox:
	:type theBox: Bnd_B2f
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const Bnd_B2f & theBox,const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given point for the inclusion in the Box. Returns True if the point is outside.
	:param thePnt:
	:type thePnt: gp_XY
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XY & thePnt);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check a circle for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theCenter:
	:type theCenter: gp_XY
	:param theRadius:
	:type theRadius: float
	:param isCircleHollow: default value is Standard_False
	:type isCircleHollow: bool
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XY & theCenter,const Standard_Real theRadius,const Standard_Boolean isCircleHollow = Standard_False);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given box for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theOtherBox:
	:type theOtherBox: Bnd_B2f
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_B2f & theOtherBox);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given box oriented by the given transformation for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theOtherBox:
	:type theOtherBox: Bnd_B2f
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_B2f & theOtherBox,const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given Line for the intersection with the current box. Returns True if there is no intersection.
	:param theLine:
	:type theLine: gp_Ax2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Ax2d & theLine);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the Segment defined by the couple of input points for the intersection with the current box. Returns True if there is no intersection.
	:param theP0:
	:type theP0: gp_XY
	:param theP1:
	:type theP1: gp_XY
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XY & theP0,const gp_XY & theP1);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Returns True if the box is void (non-initialized).
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid ();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "* Limit the Box by the internals of theOtherBox. Returns True if the limitation takes place, otherwise False indicating that the boxes do not intersect.
	:param theOtherBox:
	:type theOtherBox: Bnd_B2f
	:rtype: bool") Limit;
		Standard_Boolean Limit (const Bnd_B2f & theOtherBox);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "* Set the Center coordinates
	:param theCenter:
	:type theCenter: gp_XY
	:rtype: None") SetCenter;
		void SetCenter (const gp_XY & theCenter);

		/****************** SetHSize ******************/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "* Set the HSize (half-diagonal) coordinates. All components of theHSize must be non-negative.
	:param theHSize:
	:type theHSize: gp_XY
	:rtype: None") SetHSize;
		void SetHSize (const gp_XY & theHSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "* Query the square diagonal. If the box is VOID (see method IsVoid()) then a very big real value is returned.
	:rtype: float") SquareExtent;
		Standard_Real SquareExtent ();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transform the bounding box with the given transformation. The resulting box will be larger if theTrsf contains rotation.
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: Bnd_B2f") Transformed;
		Bnd_B2f Transformed (const gp_Trsf2d & theTrsf);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by a point.
	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: None") Add;
		void Add (const gp_XYZ & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by a point.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") Add;
		void Add (const gp_Pnt & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by another box.
	:param theBox:
	:type theBox: Bnd_B3d
	:rtype: None") Add;
		void Add (const Bnd_B3d & theBox);

		/****************** Bnd_B3d ******************/
		%feature("compactdefaultargs") Bnd_B3d;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Bnd_B3d;
		 Bnd_B3d ();

		/****************** Bnd_B3d ******************/
		%feature("compactdefaultargs") Bnd_B3d;
		%feature("autodoc", "* Constructor.
	:param theCenter:
	:type theCenter: gp_XYZ
	:param theHSize:
	:type theHSize: gp_XYZ
	:rtype: None") Bnd_B3d;
		 Bnd_B3d (const gp_XYZ & theCenter,const gp_XYZ & theHSize);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Reset the box data.
	:rtype: None") Clear;
		void Clear ();

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "* Query the upper corner: (Center + HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
	:rtype: gp_XYZ") CornerMax;
		gp_XYZ CornerMax ();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "* Query the lower corner: (Center - HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
	:rtype: gp_XYZ") CornerMin;
		gp_XYZ CornerMin ();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "* Extend the Box by the absolute value of theDiff.
	:param theDiff:
	:type theDiff: float
	:rtype: None") Enlarge;
		void Enlarge (const Standard_Real theDiff);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Check that the box 'this' is inside the given box 'theBox'. Returns True if 'this' box is fully inside 'theBox'.
	:param theBox:
	:type theBox: Bnd_B3d
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const Bnd_B3d & theBox);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Check that the box 'this' is inside the given box 'theBox' transformed by 'theTrsf'. Returns True if 'this' box is fully inside the transformed 'theBox'.
	:param theBox:
	:type theBox: Bnd_B3d
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const Bnd_B3d & theBox,const gp_Trsf & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given point for the inclusion in the Box. Returns True if the point is outside.
	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check a sphere for the intersection with the current box. Returns True if there is no intersection between boxes. If the parameter 'IsSphereHollow' is True, then the intersection is not reported for a box that is completely inside the sphere (otherwise this method would report an intersection).
	:param theCenter:
	:type theCenter: gp_XYZ
	:param theRadius:
	:type theRadius: float
	:param isSphereHollow: default value is Standard_False
	:type isSphereHollow: bool
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & theCenter,const Standard_Real theRadius,const Standard_Boolean isSphereHollow = Standard_False);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given box for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theOtherBox:
	:type theOtherBox: Bnd_B3d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_B3d & theOtherBox);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given box oriented by the given transformation for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theOtherBox:
	:type theOtherBox: Bnd_B3d
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_B3d & theOtherBox,const gp_Trsf & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given Line for the intersection with the current box. Returns True if there is no intersection. isRay==True means intersection check with the positive half-line theOverthickness is the addition to the size of the current box (may be negative). If positive, it can be treated as the thickness of the line 'theLine' or the radius of the cylinder along 'theLine'
	:param theLine:
	:type theLine: gp_Ax1
	:param isRay: default value is Standard_False
	:type isRay: bool
	:param theOverthickness: default value is 0.0
	:type theOverthickness: float
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Ax1 & theLine,const Standard_Boolean isRay = Standard_False,const Standard_Real theOverthickness = 0.0);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given Plane for the intersection with the current box. Returns True if there is no intersection.
	:param thePlane:
	:type thePlane: gp_Ax3
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Ax3 & thePlane);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Returns True if the box is void (non-initialized).
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid ();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "* Limit the Box by the internals of theOtherBox. Returns True if the limitation takes place, otherwise False indicating that the boxes do not intersect.
	:param theOtherBox:
	:type theOtherBox: Bnd_B3d
	:rtype: bool") Limit;
		Standard_Boolean Limit (const Bnd_B3d & theOtherBox);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "* Set the Center coordinates
	:param theCenter:
	:type theCenter: gp_XYZ
	:rtype: None") SetCenter;
		void SetCenter (const gp_XYZ & theCenter);

		/****************** SetHSize ******************/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "* Set the HSize (half-diagonal) coordinates. All components of theHSize must be non-negative.
	:param theHSize:
	:type theHSize: gp_XYZ
	:rtype: None") SetHSize;
		void SetHSize (const gp_XYZ & theHSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "* Query the square diagonal. If the box is VOID (see method IsVoid()) then a very big real value is returned.
	:rtype: float") SquareExtent;
		Standard_Real SquareExtent ();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transform the bounding box with the given transformation. The resulting box will be larger if theTrsf contains rotation.
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: Bnd_B3d") Transformed;
		Bnd_B3d Transformed (const gp_Trsf & theTrsf);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by a point.
	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: None") Add;
		void Add (const gp_XYZ & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by a point.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") Add;
		void Add (const gp_Pnt & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Update the box by another box.
	:param theBox:
	:type theBox: Bnd_B3f
	:rtype: None") Add;
		void Add (const Bnd_B3f & theBox);

		/****************** Bnd_B3f ******************/
		%feature("compactdefaultargs") Bnd_B3f;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Bnd_B3f;
		 Bnd_B3f ();

		/****************** Bnd_B3f ******************/
		%feature("compactdefaultargs") Bnd_B3f;
		%feature("autodoc", "* Constructor.
	:param theCenter:
	:type theCenter: gp_XYZ
	:param theHSize:
	:type theHSize: gp_XYZ
	:rtype: None") Bnd_B3f;
		 Bnd_B3f (const gp_XYZ & theCenter,const gp_XYZ & theHSize);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Reset the box data.
	:rtype: None") Clear;
		void Clear ();

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "* Query the upper corner: (Center + HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
	:rtype: gp_XYZ") CornerMax;
		gp_XYZ CornerMax ();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "* Query the lower corner: (Center - HSize). You must make sure that the box is NOT VOID (see IsVoid()), otherwise the method returns irrelevant result.
	:rtype: gp_XYZ") CornerMin;
		gp_XYZ CornerMin ();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "* Extend the Box by the absolute value of theDiff.
	:param theDiff:
	:type theDiff: float
	:rtype: None") Enlarge;
		void Enlarge (const Standard_Real theDiff);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Check that the box 'this' is inside the given box 'theBox'. Returns True if 'this' box is fully inside 'theBox'.
	:param theBox:
	:type theBox: Bnd_B3f
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const Bnd_B3f & theBox);

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Check that the box 'this' is inside the given box 'theBox' transformed by 'theTrsf'. Returns True if 'this' box is fully inside the transformed 'theBox'.
	:param theBox:
	:type theBox: Bnd_B3f
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const Bnd_B3f & theBox,const gp_Trsf & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given point for the inclusion in the Box. Returns True if the point is outside.
	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check a sphere for the intersection with the current box. Returns True if there is no intersection between boxes. If the parameter 'IsSphereHollow' is True, then the intersection is not reported for a box that is completely inside the sphere (otherwise this method would report an intersection).
	:param theCenter:
	:type theCenter: gp_XYZ
	:param theRadius:
	:type theRadius: float
	:param isSphereHollow: default value is Standard_False
	:type isSphereHollow: bool
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & theCenter,const Standard_Real theRadius,const Standard_Boolean isSphereHollow = Standard_False);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given box for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theOtherBox:
	:type theOtherBox: Bnd_B3f
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_B3f & theOtherBox);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given box oriented by the given transformation for the intersection with the current box. Returns True if there is no intersection between boxes.
	:param theOtherBox:
	:type theOtherBox: Bnd_B3f
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_B3f & theOtherBox,const gp_Trsf & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given Line for the intersection with the current box. Returns True if there is no intersection. isRay==True means intersection check with the positive half-line theOverthickness is the addition to the size of the current box (may be negative). If positive, it can be treated as the thickness of the line 'theLine' or the radius of the cylinder along 'theLine'
	:param theLine:
	:type theLine: gp_Ax1
	:param isRay: default value is Standard_False
	:type isRay: bool
	:param theOverthickness: default value is 0.0
	:type theOverthickness: float
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Ax1 & theLine,const Standard_Boolean isRay = Standard_False,const Standard_Real theOverthickness = 0.0);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check the given Plane for the intersection with the current box. Returns True if there is no intersection.
	:param thePlane:
	:type thePlane: gp_Ax3
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Ax3 & thePlane);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Returns True if the box is void (non-initialized).
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid ();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "* Limit the Box by the internals of theOtherBox. Returns True if the limitation takes place, otherwise False indicating that the boxes do not intersect.
	:param theOtherBox:
	:type theOtherBox: Bnd_B3f
	:rtype: bool") Limit;
		Standard_Boolean Limit (const Bnd_B3f & theOtherBox);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "* Set the Center coordinates
	:param theCenter:
	:type theCenter: gp_XYZ
	:rtype: None") SetCenter;
		void SetCenter (const gp_XYZ & theCenter);

		/****************** SetHSize ******************/
		%feature("compactdefaultargs") SetHSize;
		%feature("autodoc", "* Set the HSize (half-diagonal) coordinates. All components of theHSize must be non-negative.
	:param theHSize:
	:type theHSize: gp_XYZ
	:rtype: None") SetHSize;
		void SetHSize (const gp_XYZ & theHSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "* Query the square diagonal. If the box is VOID (see method IsVoid()) then a very big real value is returned.
	:rtype: float") SquareExtent;
		Standard_Real SquareExtent ();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transform the bounding box with the given transformation. The resulting box will be larger if theTrsf contains rotation.
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: Bnd_B3f") Transformed;
		Bnd_B3f Transformed (const gp_Trsf & theTrsf);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the bounding box theBox at position boxIndex in the array of boxes to be sorted by this comparison algorithm. This function is used only in conjunction with the third syntax described in the synopsis of Initialize. //! Exceptions: //! - Standard_OutOfRange if boxIndex is not in the range [ 1,nbComponents ] where nbComponents is the maximum number of bounding boxes declared for this comparison algorithm at initialization. //! - Standard_MultiplyDefined if a box already exists at position boxIndex in the array of boxes to be sorted by this comparison algorithm.
	:param theBox:
	:type theBox: Bnd_Box
	:param boxIndex:
	:type boxIndex: int
	:rtype: None") Add;
		void Add (const Bnd_Box & theBox,const Standard_Integer boxIndex);

		/****************** Bnd_BoundSortBox ******************/
		%feature("compactdefaultargs") Bnd_BoundSortBox;
		%feature("autodoc", "* Constructs an empty comparison algorithm for bounding boxes. The bounding boxes are then defined using the Initialize function.
	:rtype: None") Bnd_BoundSortBox;
		 Bnd_BoundSortBox ();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Compares the bounding box theBox, with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: TColStd_ListOfInteger") Compare;
		const TColStd_ListOfInteger & Compare (const Bnd_Box & theBox);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Compares the plane P with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.
	:param P:
	:type P: gp_Pln
	:rtype: TColStd_ListOfInteger") Compare;
		const TColStd_ListOfInteger & Compare (const gp_Pln & P);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes this comparison algorithm with - the set of bounding boxes SetOfBox.
	:param CompleteBox:
	:type CompleteBox: Bnd_Box
	:param SetOfBox:
	:type SetOfBox: Bnd_HArray1OfBox
	:rtype: None") Initialize;
		void Initialize (const Bnd_Box & CompleteBox,const opencascade::handle<Bnd_HArray1OfBox> & SetOfBox);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes this comparison algorithm with - the set of bounding boxes SetOfBox, where CompleteBox is given as the global bounding box of SetOfBox.
	:param SetOfBox:
	:type SetOfBox: Bnd_HArray1OfBox
	:rtype: None") Initialize;
		void Initialize (const opencascade::handle<Bnd_HArray1OfBox> & SetOfBox);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes this comparison algorithm, giving it only - the maximum number nbComponents of the bounding boxes to be managed. Use the Add function to define the array of bounding boxes to be sorted by this algorithm.
	:param CompleteBox:
	:type CompleteBox: Bnd_Box
	:param nbComponents:
	:type nbComponents: int
	:rtype: None") Initialize;
		void Initialize (const Bnd_Box & CompleteBox,const Standard_Integer nbComponents);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the 2D bounding box theBox at position boxIndex in the array of boxes to be sorted by this comparison algorithm. This function is used only in conjunction with the third syntax described in the synopsis of Initialize. Exceptions - Standard_OutOfRange if boxIndex is not in the range [ 1,nbComponents ] where nbComponents is the maximum number of bounding boxes declared for this comparison algorithm at initialization. - Standard_MultiplyDefined if a box still exists at position boxIndex in the array of boxes to be sorted by this comparison algorithm.
	:param theBox:
	:type theBox: Bnd_Box2d
	:param boxIndex:
	:type boxIndex: int
	:rtype: None") Add;
		void Add (const Bnd_Box2d & theBox,const Standard_Integer boxIndex);

		/****************** Bnd_BoundSortBox2d ******************/
		%feature("compactdefaultargs") Bnd_BoundSortBox2d;
		%feature("autodoc", "* Constructs an empty comparison algorithm for 2D bounding boxes. The bounding boxes are then defined using the Initialize function.
	:rtype: None") Bnd_BoundSortBox2d;
		 Bnd_BoundSortBox2d ();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Compares the 2D bounding box theBox with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.
	:param theBox:
	:type theBox: Bnd_Box2d
	:rtype: TColStd_ListOfInteger") Compare;
		const TColStd_ListOfInteger & Compare (const Bnd_Box2d & theBox);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes this comparison algorithm with - the set of 2D bounding boxes SetOfBox
	:param CompleteBox:
	:type CompleteBox: Bnd_Box2d
	:param SetOfBox:
	:type SetOfBox: Bnd_HArray1OfBox2d
	:rtype: None") Initialize;
		void Initialize (const Bnd_Box2d & CompleteBox,const opencascade::handle<Bnd_HArray1OfBox2d> & SetOfBox);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes this comparison algorithm with - the set of 2D bounding boxes SetOfBox, where CompleteBox is given as the global bounding box of SetOfBox.
	:param SetOfBox:
	:type SetOfBox: Bnd_HArray1OfBox2d
	:rtype: None") Initialize;
		void Initialize (const opencascade::handle<Bnd_HArray1OfBox2d> & SetOfBox);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes this comparison algorithm, giving it only - the maximum number nbComponents, and - the global bounding box CompleteBox, of the 2D bounding boxes to be managed. Use the Add function to define the array of bounding boxes to be sorted by this algorithm.
	:param CompleteBox:
	:type CompleteBox: Bnd_Box2d
	:param nbComponents:
	:type nbComponents: int
	:rtype: None") Initialize;
		void Initialize (const Bnd_Box2d & CompleteBox,const Standard_Integer nbComponents);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the box <Other> to <self>.
	:param Other:
	:type Other: Bnd_Box
	:rtype: None") Add;
		void Add (const Bnd_Box & Other);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Pnt to the box.
	:param P:
	:type P: gp_Pnt
	:rtype: None") Add;
		void Add (const gp_Pnt & P);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Extends <self> from the Pnt <P> in the direction <D>.
	:param P:
	:type P: gp_Pnt
	:param D:
	:type D: gp_Dir
	:rtype: None") Add;
		void Add (const gp_Pnt & P,const gp_Dir & D);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Extends the Box in the given Direction, i.e. adds an half-line. The box may become infinite in 1,2 or 3 directions.
	:param D:
	:type D: gp_Dir
	:rtype: None") Add;
		void Add (const gp_Dir & D);

		/****************** Bnd_Box ******************/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "* Creates an empty Box. The constructed box is qualified Void. Its gap is null.
	:rtype: None") Bnd_Box;
		 Bnd_Box ();

		/****************** Bnd_Box ******************/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "* Creates a bounding box, it contains: - minimum/maximum point of bouning box, The constructed box is qualified Void. Its gap is null.
	:param theMin:
	:type theMin: gp_Pnt
	:param theMax:
	:type theMax: gp_Pnt
	:rtype: None") Bnd_Box;
		 Bnd_Box (const gp_Pnt theMin,const gp_Pnt theMax);

		/****************** CornerMax ******************/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "* Returns the upper corner of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid()
	:rtype: gp_Pnt") CornerMax;
		gp_Pnt CornerMax ();

		/****************** CornerMin ******************/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "* Returns the lower corner of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid()
	:rtype: gp_Pnt") CornerMin;
		gp_Pnt CornerMin ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the minimum distance between two boxes.
	:param Other:
	:type Other: Bnd_Box
	:rtype: float") Distance;
		Standard_Real Distance (const Bnd_Box & Other);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "* Enlarges the box with a tolerance value. (minvalues-Abs(<tol>) and maxvalues+Abs(<tol>)) This means that the minimum values of its X, Y and Z intervals of definition, when they are finite, are reduced by the absolute value of Tol, while the maximum values are increased by the same amount.
	:param Tol:
	:type Tol: float
	:rtype: None") Enlarge;
		void Enlarge (const Standard_Real Tol);

		/****************** FinitePart ******************/
		%feature("compactdefaultargs") FinitePart;
		%feature("autodoc", "* Returns a finite part of an infinite bounding box (returns self if this is already finite box). This can be a Void box in case if its sides has been defined as infinite (Open) without adding any finite points. WARNING! This method relies on Open flags, the infinite points added using Add() method will be returned as is.
	:rtype: Bnd_Box") FinitePart;
		Bnd_Box FinitePart ();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "* Returns the bounds of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid()
	:param theXmin:
	:type theXmin: float
	:param theYmin:
	:type theYmin: float
	:param theZmin:
	:type theZmin: float
	:param theXmax:
	:type theXmax: float
	:param theYmax:
	:type theYmax: float
	:param theZmax:
	:type theZmax: float
	:rtype: None") Get;
		void Get (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetGap ******************/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "* Returns the gap of this bounding box.
	:rtype: float") GetGap;
		Standard_Real GetGap ();

		/****************** HasFinitePart ******************/
		%feature("compactdefaultargs") HasFinitePart;
		%feature("autodoc", "* Returns True if this box has finite part.
	:rtype: bool") HasFinitePart;
		Standard_Boolean HasFinitePart ();

		/****************** IsOpen ******************/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "* Returns true if this bounding box has at least one open direction.
	:rtype: bool") IsOpen;
		Standard_Boolean IsOpen ();

		/****************** IsOpenXmax ******************/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "* Returns true if this bounding box is open in the Xmax direction.
	:rtype: bool") IsOpenXmax;
		Standard_Boolean IsOpenXmax ();

		/****************** IsOpenXmin ******************/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "* Returns true if this bounding box is open in the Xmin direction.
	:rtype: bool") IsOpenXmin;
		Standard_Boolean IsOpenXmin ();

		/****************** IsOpenYmax ******************/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "* Returns true if this bounding box is open in the Ymax direction.
	:rtype: bool") IsOpenYmax;
		Standard_Boolean IsOpenYmax ();

		/****************** IsOpenYmin ******************/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "* Returns true if this bounding box is open in the Ymix direction.
	:rtype: bool") IsOpenYmin;
		Standard_Boolean IsOpenYmin ();

		/****************** IsOpenZmax ******************/
		%feature("compactdefaultargs") IsOpenZmax;
		%feature("autodoc", "* Returns true if this bounding box is open in the Zmax direction.
	:rtype: bool") IsOpenZmax;
		Standard_Boolean IsOpenZmax ();

		/****************** IsOpenZmin ******************/
		%feature("compactdefaultargs") IsOpenZmin;
		%feature("autodoc", "* Returns true if this bounding box is open in the Zmin direction.
	:rtype: bool") IsOpenZmin;
		Standard_Boolean IsOpenZmin ();

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns True if the Pnt is out the box.
	:param P:
	:type P: gp_Pnt
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Pnt & P);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns False if the line intersects the box.
	:param L:
	:type L: gp_Lin
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Lin & L);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns False if the plane intersects the box.
	:param P:
	:type P: gp_Pln
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Pln & P);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns False if the <Box> intersects or is inside <self>.
	:param Other:
	:type Other: Bnd_Box
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_Box & Other);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns False if the transformed <Box> intersects or is inside <self>.
	:param Other:
	:type Other: Bnd_Box
	:param T:
	:type T: gp_Trsf
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_Box & Other,const gp_Trsf & T);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns False if the transformed <Box> intersects or is inside the transformed box <self>.
	:param T1:
	:type T1: gp_Trsf
	:param Other:
	:type Other: Bnd_Box
	:param T2:
	:type T2: gp_Trsf
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Trsf & T1,const Bnd_Box & Other,const gp_Trsf & T2);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns False if the flat band lying between two parallel lines represented by their reference points <P1>, <P2> and direction <D> intersects the box.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param D:
	:type D: gp_Dir
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Dir & D);

		/****************** IsThin ******************/
		%feature("compactdefaultargs") IsThin;
		%feature("autodoc", "* Returns true if IsXThin, IsYThin and IsZThin are all true, i.e. if the box is thin in all three dimensions.
	:param tol:
	:type tol: float
	:rtype: bool") IsThin;
		Standard_Boolean IsThin (const Standard_Real tol);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Returns true if this bounding box is empty (Void flag).
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid ();

		/****************** IsWhole ******************/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "* Returns true if this bounding box is infinite in all 6 directions (WholeSpace flag).
	:rtype: bool") IsWhole;
		Standard_Boolean IsWhole ();

		/****************** IsXThin ******************/
		%feature("compactdefaultargs") IsXThin;
		%feature("autodoc", "* true if xmax-xmin < tol.
	:param tol:
	:type tol: float
	:rtype: bool") IsXThin;
		Standard_Boolean IsXThin (const Standard_Real tol);

		/****************** IsYThin ******************/
		%feature("compactdefaultargs") IsYThin;
		%feature("autodoc", "* true if ymax-ymin < tol.
	:param tol:
	:type tol: float
	:rtype: bool") IsYThin;
		Standard_Boolean IsYThin (const Standard_Real tol);

		/****************** IsZThin ******************/
		%feature("compactdefaultargs") IsZThin;
		%feature("autodoc", "* true if zmax-zmin < tol.
	:param tol:
	:type tol: float
	:rtype: bool") IsZThin;
		Standard_Boolean IsZThin (const Standard_Real tol);

		/****************** OpenXmax ******************/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "* The Box will be infinitely long in the Xmax direction.
	:rtype: None") OpenXmax;
		void OpenXmax ();

		/****************** OpenXmin ******************/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "* The Box will be infinitely long in the Xmin direction.
	:rtype: None") OpenXmin;
		void OpenXmin ();

		/****************** OpenYmax ******************/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "* The Box will be infinitely long in the Ymax direction.
	:rtype: None") OpenYmax;
		void OpenYmax ();

		/****************** OpenYmin ******************/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "* The Box will be infinitely long in the Ymin direction.
	:rtype: None") OpenYmin;
		void OpenYmin ();

		/****************** OpenZmax ******************/
		%feature("compactdefaultargs") OpenZmax;
		%feature("autodoc", "* The Box will be infinitely long in the Zmax direction.
	:rtype: None") OpenZmax;
		void OpenZmax ();

		/****************** OpenZmin ******************/
		%feature("compactdefaultargs") OpenZmin;
		%feature("autodoc", "* The Box will be infinitely long in the Zmin direction.
	:rtype: None") OpenZmin;
		void OpenZmin ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets this bounding box so that it bounds - the point P. This involves first setting this bounding box to be void and then adding the point P.
	:param P:
	:type P: gp_Pnt
	:rtype: None") Set;
		void Set (const gp_Pnt & P);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets this bounding box so that it bounds the half-line defined by point P and direction D, i.e. all points M defined by M=P+u*D, where u is greater than or equal to 0, are inside the bounding volume. This involves first setting this box to be void and then adding the half-line.
	:param P:
	:type P: gp_Pnt
	:param D:
	:type D: gp_Dir
	:rtype: None") Set;
		void Set (const gp_Pnt & P,const gp_Dir & D);

		/****************** SetGap ******************/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "* Set the gap of this bounding box to abs(Tol).
	:param Tol:
	:type Tol: float
	:rtype: None") SetGap;
		void SetGap (const Standard_Real Tol);

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "* Sets this bounding box so that it is empty. All points are outside a void box.
	:rtype: None") SetVoid;
		void SetVoid ();

		/****************** SetWhole ******************/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "* Sets this bounding box so that it covers the whole of 3D space. It is infinitely long in all directions.
	:rtype: None") SetWhole;
		void SetWhole ();

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "* Computes the squared diagonal of me.
	:rtype: float") SquareExtent;
		Standard_Real SquareExtent ();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Returns a bounding box which is the result of applying the transformation T to this bounding box. Warning Applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. This is not optimal for algorithms which use it.
	:param T:
	:type T: gp_Trsf
	:rtype: Bnd_Box") Transformed;
		Bnd_Box Transformed (const gp_Trsf & T);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Enlarges this bounding box, if required, so that it contains at least: - interval [ aXmin,aXmax ] in the 'X Direction', - interval [ aYmin,aYmax ] in the 'Y Direction', - interval [ aZmin,aZmax ] in the 'Z Direction';
	:param aXmin:
	:type aXmin: float
	:param aYmin:
	:type aYmin: float
	:param aZmin:
	:type aZmin: float
	:param aXmax:
	:type aXmax: float
	:param aYmax:
	:type aYmax: float
	:param aZmax:
	:type aZmax: float
	:rtype: None") Update;
		void Update (const Standard_Real aXmin,const Standard_Real aYmin,const Standard_Real aZmin,const Standard_Real aXmax,const Standard_Real aYmax,const Standard_Real aZmax);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Adds a point of coordinates (X,Y,Z) to this bounding box.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") Update;
		void Update (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the 2d box <Other> to <self>.
	:param Other:
	:type Other: Bnd_Box2d
	:rtype: None") Add;
		void Add (const Bnd_Box2d & Other);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the 2d point.
	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None") Add;
		void Add (const gp_Pnt2d & thePnt);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Extends bounding box from thePnt in the direction theDir.
	:param thePnt:
	:type thePnt: gp_Pnt2d
	:param theDir:
	:type theDir: gp_Dir2d
	:rtype: None") Add;
		void Add (const gp_Pnt2d & thePnt,const gp_Dir2d & theDir);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Extends the Box in the given Direction, i.e. adds a half-line. The box may become infinite in 1 or 2 directions.
	:param D:
	:type D: gp_Dir2d
	:rtype: None") Add;
		void Add (const gp_Dir2d & D);

		/****************** Bnd_Box2d ******************/
		%feature("compactdefaultargs") Bnd_Box2d;
		%feature("autodoc", "* Creates an empty 2D bounding box. The constructed box is qualified Void. Its gap is null.
	:rtype: None") Bnd_Box2d;
		 Bnd_Box2d ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "* Enlarges the box with a tolerance value. This means that the minimum values of its X and Y intervals of definition, when they are finite, are reduced by the absolute value of Tol, while the maximum values are increased by the same amount.
	:param theTol:
	:type theTol: float
	:rtype: None") Enlarge;
		void Enlarge (const Standard_Real theTol);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "* Returns the bounds of this 2D bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). if IsVoid()
	:param aXmin:
	:type aXmin: float
	:param aYmin:
	:type aYmin: float
	:param aXmax:
	:type aXmax: float
	:param aYmax:
	:type aYmax: float
	:rtype: None") Get;
		void Get (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetGap ******************/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "* Returns the gap of this 2D bounding box.
	:rtype: float") GetGap;
		Standard_Real GetGap ();

		/****************** IsOpenXmax ******************/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "* Returns true if this bounding box is open in the Xmax direction.
	:rtype: bool") IsOpenXmax;
		Standard_Boolean IsOpenXmax ();

		/****************** IsOpenXmin ******************/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "* Returns true if this bounding box is open in the Xmin direction.
	:rtype: bool") IsOpenXmin;
		Standard_Boolean IsOpenXmin ();

		/****************** IsOpenYmax ******************/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "* Returns true if this bounding box is open in the Ymax direction.
	:rtype: bool") IsOpenYmax;
		Standard_Boolean IsOpenYmax ();

		/****************** IsOpenYmin ******************/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "* Returns true if this bounding box is open in the Ymin direction.
	:rtype: bool") IsOpenYmin;
		Standard_Boolean IsOpenYmin ();

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns True if the 2d pnt <P> is out <self>.
	:param P:
	:type P: gp_Pnt2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Pnt2d & P);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns True if <Box2d> is out <self>.
	:param Other:
	:type Other: Bnd_Box2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_Box2d & Other);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns True if transformed <Box2d> is out <self>.
	:param theOther:
	:type theOther: Bnd_Box2d
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_Box2d & theOther,const gp_Trsf2d & theTrsf);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Compares a transformed bounding with a transformed bounding. The default implementation is to make a copy of <self> and <Other>, to transform them and to test.
	:param T1:
	:type T1: gp_Trsf2d
	:param Other:
	:type Other: Bnd_Box2d
	:param T2:
	:type T2: gp_Trsf2d
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Trsf2d & T1,const Bnd_Box2d & Other,const gp_Trsf2d & T2);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Returns true if this 2D bounding box is empty (Void flag).
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid ();

		/****************** IsWhole ******************/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "* Returns true if this bounding box is infinite in all 4 directions (Whole Space flag).
	:rtype: bool") IsWhole;
		Standard_Boolean IsWhole ();

		/****************** OpenXmax ******************/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "* The Box will be infinitely long in the Xmax direction.
	:rtype: None") OpenXmax;
		void OpenXmax ();

		/****************** OpenXmin ******************/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "* The Box will be infinitely long in the Xmin direction.
	:rtype: None") OpenXmin;
		void OpenXmin ();

		/****************** OpenYmax ******************/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "* The Box will be infinitely long in the Ymax direction.
	:rtype: None") OpenYmax;
		void OpenYmax ();

		/****************** OpenYmin ******************/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "* The Box will be infinitely long in the Ymin direction.
	:rtype: None") OpenYmin;
		void OpenYmin ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets this 2D bounding box so that it bounds the point P. This involves first setting this bounding box to be void and then adding the point PThe rectangle bounds the point <P>.
	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None") Set;
		void Set (const gp_Pnt2d & thePnt);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets this 2D bounding box so that it bounds the half-line defined by point P and direction D, i.e. all points M defined by M=P+u*D, where u is greater than or equal to 0, are inside the bounding area. This involves first setting this 2D box to be void and then adding the half-line.
	:param thePnt:
	:type thePnt: gp_Pnt2d
	:param theDir:
	:type theDir: gp_Dir2d
	:rtype: None") Set;
		void Set (const gp_Pnt2d & thePnt,const gp_Dir2d & theDir);

		/****************** SetGap ******************/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "* Set the gap of this 2D bounding box to abs(Tol).
	:param Tol:
	:type Tol: float
	:rtype: None") SetGap;
		void SetGap (const Standard_Real Tol);

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "* Sets this 2D bounding box so that it is empty. All points are outside a void box.
	:rtype: None") SetVoid;
		void SetVoid ();

		/****************** SetWhole ******************/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "* Sets this bounding box so that it covers the whole 2D space, i.e. it is infinite in all directions.
	:rtype: None") SetWhole;
		void SetWhole ();

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "* Computes the squared diagonal of me.
	:rtype: float") SquareExtent;
		Standard_Real SquareExtent ();

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Returns a bounding box which is the result of applying the transformation T to this bounding box. Warning Applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. This is not optimal for algorithms which use it.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Bnd_Box2d") Transformed;
		Bnd_Box2d Transformed (const gp_Trsf2d & T);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Enlarges this 2D bounding box, if required, so that it contains at least: - interval [ aXmin,aXmax ] in the 'X Direction', - interval [ aYmin,aYmax ] in the 'Y Direction'
	:param aXmin:
	:type aXmin: float
	:param aYmin:
	:type aYmin: float
	:param aXmax:
	:type aXmax: float
	:param aYmax:
	:type aYmax: float
	:rtype: None") Update;
		void Update (const Standard_Real aXmin,const Standard_Real aYmin,const Standard_Real aXmax,const Standard_Real aYmax);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Adds a point of coordinates (X,Y) to this bounding box.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None") Update;
		void Update (const Standard_Real X,const Standard_Real Y);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Rebuilds this in order to include all previous objects (which it was created from) and theOther.
	:param theOther:
	:type theOther: Bnd_OBB
	:rtype: None") Add;
		void Add (const Bnd_OBB & theOther);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Rebuilds this in order to include all previous objects (which it was created from) and theP.
	:param theP:
	:type theP: gp_Pnt
	:rtype: None") Add;
		void Add (const gp_Pnt & theP);

		/****************** Bnd_OBB ******************/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "* Empty constructor
	:rtype: None") Bnd_OBB;
		 Bnd_OBB ();

		/****************** Bnd_OBB ******************/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "* Constructor taking all defining parameters
	:param theCenter:
	:type theCenter: gp_Pnt
	:param theXDirection:
	:type theXDirection: gp_Dir
	:param theYDirection:
	:type theYDirection: gp_Dir
	:param theZDirection:
	:type theZDirection: gp_Dir
	:param theHXSize:
	:type theHXSize: float
	:param theHYSize:
	:type theHYSize: float
	:param theHZSize:
	:type theHZSize: float
	:rtype: None") Bnd_OBB;
		 Bnd_OBB (const gp_Pnt & theCenter,const gp_Dir & theXDirection,const gp_Dir & theYDirection,const gp_Dir & theZDirection,const Standard_Real theHXSize,const Standard_Real theHYSize,const Standard_Real theHZSize);

		/****************** Bnd_OBB ******************/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "* Constructor to create OBB from AABB.
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: None") Bnd_OBB;
		 Bnd_OBB (const Bnd_Box & theBox);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Returns the center of OBB
	:rtype: gp_XYZ") Center;
		const gp_XYZ  Center ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "* Enlarges the box with the given value
	:param theGapAdd:
	:type theGapAdd: float
	:rtype: None") Enlarge;
		void Enlarge (const Standard_Real theGapAdd);

		/****************** GetVertex ******************/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "* Returns the array of vertices in <this>. The local coordinate of the vertex depending on the index of the array are follow: Index == 0: (-XHSize(), -YHSize(), -ZHSize()) Index == 1: ( XHSize(), -YHSize(), -ZHSize()) Index == 2: (-XHSize(), YHSize(), -ZHSize()) Index == 3: ( XHSize(), YHSize(), -ZHSize()) Index == 4: (-XHSize(), -YHSize(), ZHSize()) Index == 5: ( XHSize(), -YHSize(), ZHSize()) Index == 6: (-XHSize(), YHSize(), ZHSize()) Index == 7: ( XHSize(), YHSize(), ZHSize()).
	:param theP:
	:type theP: gp_Pnt
	:rtype: bool") GetVertex;
		Standard_Boolean GetVertex (gp_Pnt theP[8]);

		/****************** IsAABox ******************/
		%feature("compactdefaultargs") IsAABox;
		%feature("autodoc", "* Returns True if the box is axes aligned
	:rtype: bool") IsAABox;
		Standard_Boolean IsAABox ();

		/****************** IsCompletelyInside ******************/
		%feature("compactdefaultargs") IsCompletelyInside;
		%feature("autodoc", "* Check if the theOther is completely inside *this.
	:param theOther:
	:type theOther: Bnd_OBB
	:rtype: bool") IsCompletelyInside;
		Standard_Boolean IsCompletelyInside (const Bnd_OBB & theOther);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check if the box do not interfere the other box.
	:param theOther:
	:type theOther: Bnd_OBB
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_OBB & theOther);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Check if the point is inside of <this>.
	:param theP:
	:type theP: gp_Pnt
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_Pnt & theP);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Checks if the box is empty.
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the local coordinates system of this oriented box. So that applying it to axis-aligned box ((-XHSize, -YHSize, -ZHSize), (XHSize, YHSize, ZHSize)) will produce this oriented box. @code gp_Trsf aLoc; aLoc.SetTransformation (theOBB.Position(), gp::XOY()); @endcode
	:rtype: gp_Ax3") Position;
		gp_Ax3 Position ();

		/****************** ReBuild ******************/
		%feature("compactdefaultargs") ReBuild;
		%feature("autodoc", "* Creates new OBB covering every point in theListOfPoints. Tolerance of every such point is set by *theListOfTolerances array. If this array is not void (not null-pointer) then the resulted Bnd_OBB will be enlarged using tolerances of points lying on the box surface. <theIsOptimal> flag defines the mode in which the OBB will be built. Constructing Optimal box takes more time, but the resulting box is usually more tight. In case of construction of Optimal OBB more possible axes are checked.
	:param theListOfPoints:
	:type theListOfPoints: TColgp_Array1OfPnt
	:param theListOfTolerances: default value is 0
	:type theListOfTolerances: TColStd_Array1OfReal *
	:param theIsOptimal: default value is Standard_False
	:type theIsOptimal: bool
	:rtype: None") ReBuild;
		void ReBuild (const TColgp_Array1OfPnt & theListOfPoints,const TColStd_Array1OfReal * theListOfTolerances = 0,const Standard_Boolean theIsOptimal = Standard_False);

		/****************** SetAABox ******************/
		%feature("compactdefaultargs") SetAABox;
		%feature("autodoc", "* Sets the flag for axes aligned box
	:param theFlag:
	:type theFlag: bool
	:rtype: None") SetAABox;
		void SetAABox (const Standard_Boolean & theFlag);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "* Sets the center of OBB
	:param theCenter:
	:type theCenter: gp_Pnt
	:rtype: None") SetCenter;
		void SetCenter (const gp_Pnt & theCenter);

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "* Clears this box
	:rtype: None") SetVoid;
		void SetVoid ();

		/****************** SetXComponent ******************/
		%feature("compactdefaultargs") SetXComponent;
		%feature("autodoc", "* Sets the X component of OBB - direction and size
	:param theXDirection:
	:type theXDirection: gp_Dir
	:param theHXSize:
	:type theHXSize: float
	:rtype: None") SetXComponent;
		void SetXComponent (const gp_Dir & theXDirection,const Standard_Real theHXSize);

		/****************** SetYComponent ******************/
		%feature("compactdefaultargs") SetYComponent;
		%feature("autodoc", "* Sets the Y component of OBB - direction and size
	:param theYDirection:
	:type theYDirection: gp_Dir
	:param theHYSize:
	:type theHYSize: float
	:rtype: None") SetYComponent;
		void SetYComponent (const gp_Dir & theYDirection,const Standard_Real theHYSize);

		/****************** SetZComponent ******************/
		%feature("compactdefaultargs") SetZComponent;
		%feature("autodoc", "* Sets the Z component of OBB - direction and size
	:param theZDirection:
	:type theZDirection: gp_Dir
	:param theHZSize:
	:type theHZSize: float
	:rtype: None") SetZComponent;
		void SetZComponent (const gp_Dir & theZDirection,const Standard_Real theHZSize);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "* Returns square diagonal of this box
	:rtype: float") SquareExtent;
		Standard_Real SquareExtent ();

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "* Returns the X Direction of OBB
	:rtype: gp_XYZ") XDirection;
		const gp_XYZ  XDirection ();

		/****************** XHSize ******************/
		%feature("compactdefaultargs") XHSize;
		%feature("autodoc", "* Returns the X Dimension of OBB
	:rtype: float") XHSize;
		Standard_Real XHSize ();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "* Returns the Y Direction of OBB
	:rtype: gp_XYZ") YDirection;
		const gp_XYZ  YDirection ();

		/****************** YHSize ******************/
		%feature("compactdefaultargs") YHSize;
		%feature("autodoc", "* Returns the Y Dimension of OBB
	:rtype: float") YHSize;
		Standard_Real YHSize ();

		/****************** ZDirection ******************/
		%feature("compactdefaultargs") ZDirection;
		%feature("autodoc", "* Returns the Z Direction of OBB
	:rtype: gp_XYZ") ZDirection;
		const gp_XYZ  ZDirection ();

		/****************** ZHSize ******************/
		%feature("compactdefaultargs") ZHSize;
		%feature("autodoc", "* Returns the Z Dimension of OBB
	:rtype: float") ZHSize;
		Standard_Real ZHSize ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Extends <this> to include theParameter
	:param theParameter:
	:type theParameter: float
	:rtype: None") Add;
		void Add (const Standard_Real theParameter);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Extends this range to include both ranges. @sa use method ::Union() to check if two ranges overlap method merging
	:param theRange:
	:type theRange: Bnd_Range
	:rtype: None") Add;
		void Add (const Bnd_Range & theRange);

		/****************** Bnd_Range ******************/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "* Default constructor. Creates VOID range.
	:rtype: None") Bnd_Range;
		 Bnd_Range ();

		/****************** Bnd_Range ******************/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "* Constructor. Never creates VOID range.
	:param theMin:
	:type theMin: float
	:param theMax:
	:type theMax: float
	:rtype: None") Bnd_Range;
		 Bnd_Range (const Standard_Real theMin,const Standard_Real theMax);

		/****************** Common ******************/
		%feature("compactdefaultargs") Common;
		%feature("autodoc", "* Replaces <this> with common-part of <this> and theOther
	:param theOther:
	:type theOther: Bnd_Range
	:rtype: None") Common;
		void Common (const Bnd_Range & theOther);

		/****************** Delta ******************/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "* Returns range value (MAX-MIN). Returns negative value for VOID range.
	:rtype: float") Delta;
		Standard_Real Delta ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Enlarge ******************/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "* Extends this to the given value (in both side)
	:param theDelta:
	:type theDelta: float
	:rtype: None") Enlarge;
		void Enlarge (const Standard_Real theDelta);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "* Obtain first and last boundary of <this>. If <this> is VOID the method returns false.
	:param theFirstPar:
	:type theFirstPar: float
	:param theLastPar:
	:type theLastPar: float
	:rtype: bool") GetBounds;
		Standard_Boolean GetBounds (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetIntermediatePoint ******************/
		%feature("compactdefaultargs") GetIntermediatePoint;
		%feature("autodoc", "* Obtain theParameter satisfied to the equation (theParameter-MIN)/(MAX-MIN) == theLambda. * theLambda == 0 --> MIN boundary will be returned; * theLambda == 0.5 --> Middle point will be returned; * theLambda == 1 --> MAX boundary will be returned; * theLambda < 0 --> the value less than MIN will be returned; * theLambda > 1 --> the value greater than MAX will be returned. If <this> is VOID the method returns false.
	:param theLambda:
	:type theLambda: float
	:param theParameter:
	:type theParameter: float
	:rtype: bool") GetIntermediatePoint;
		Standard_Boolean GetIntermediatePoint (const Standard_Real theLambda,Standard_Real &OutValue);

		/****************** GetMax ******************/
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "* Obtain MAX boundary of <this>. If <this> is VOID the method returns false.
	:param thePar:
	:type thePar: float
	:rtype: bool") GetMax;
		Standard_Boolean GetMax (Standard_Real &OutValue);

		/****************** GetMin ******************/
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "* Obtain MIN boundary of <this>. If <this> is VOID the method returns false.
	:param thePar:
	:type thePar: float
	:rtype: bool") GetMin;
		Standard_Boolean GetMin (Standard_Real &OutValue);

		/****************** IsIntersected ******************/
		%feature("compactdefaultargs") IsIntersected;
		%feature("autodoc", "* Checks if <this> intersects values like theVal+k*thePeriod, where k is an integer number (k = 0, +/-1, +/-2, ...). Returns: 0 - if <this> does not intersect the theVal+k*thePeriod. 1 - if <this> intersects theVal+k*thePeriod. 2 - if myFirst or/and myLast are equal to theVal+k*thePeriod. //! ATTENTION!!! If (myFirst == myLast) then this function will return only either 0 or 2.
	:param theVal:
	:type theVal: float
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: int") IsIntersected;
		Standard_Integer IsIntersected (const Standard_Real theVal,const Standard_Real thePeriod = 0.0);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns True if the value is out of this range.
	:param theValue:
	:type theValue: float
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (Standard_Real theValue);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "* Returns True if the given range is out of this range.
	:param theRange:
	:type theRange: Bnd_Range
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_Range & theRange);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Is <this> initialized.
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid ();

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "* Initializes <this> by default parameters. Makes <this> VOID.
	:rtype: None") SetVoid;
		void SetVoid ();

		/****************** Shift ******************/
		%feature("compactdefaultargs") Shift;
		%feature("autodoc", "* Shifts <*this> by theVal
	:param theVal:
	:type theVal: float
	:rtype: None") Shift;
		void Shift (const Standard_Real theVal);

		/****************** Shifted ******************/
		%feature("compactdefaultargs") Shifted;
		%feature("autodoc", "* Returns the copy of <*this> shifted by theVal
	:param theVal:
	:type theVal: float
	:rtype: Bnd_Range") Shifted;
		Bnd_Range Shifted (const Standard_Real theVal);

		/****************** Split ******************/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "* Splits <this> to several sub-ranges by theVal value (e.g. range [3, 15] will be split by theVal==5 to the two ranges: [3, 5] and [5, 15]). New ranges will be pushed to theList (theList must be initialized correctly before calling this method). If thePeriod != 0.0 then at least one boundary of new ranges (if <*this> intersects theVal+k*thePeriod) will be equal to theVal+thePeriod*k, where k is an integer number (k = 0, +/-1, +/-2, ...). (let thePeriod in above example be 4 ==> we will obtain four ranges: [3, 5], [5, 9], [9, 13] and [13, 15].
	:param theVal:
	:type theVal: float
	:param theList:
	:type theList: NCollection_List<Bnd_Range>
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None") Split;
		void Split (const Standard_Real theVal,NCollection_List<Bnd_Range> & theList,const Standard_Real thePeriod = 0.0);

		/****************** TrimFrom ******************/
		%feature("compactdefaultargs") TrimFrom;
		%feature("autodoc", "* Trims the First value in range by the given lower limit. Marks range as Void if the given Lower value is greater than range Max.
	:param theValLower:
	:type theValLower: float
	:rtype: None") TrimFrom;
		void TrimFrom (const Standard_Real theValLower);

		/****************** TrimTo ******************/
		%feature("compactdefaultargs") TrimTo;
		%feature("autodoc", "* Trim the Last value in range by the given Upper limit. Marks range as Void if the given Upper value is smaller than range Max.
	:param theValUpper:
	:type theValUpper: float
	:rtype: None") TrimTo;
		void TrimTo (const Standard_Real theValUpper);

		/****************** Union ******************/
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "* Joins *this and theOther to one interval. Replaces *this to the result. Returns false if the operation cannot be done (e.g. input arguments are empty or separated). @sa use method ::Add() to merge two ranges unconditionally
	:param theOther:
	:type theOther: Bnd_Range
	:rtype: bool") Union;
		Standard_Boolean Union (const Bnd_Range & theOther);


        %extend{
            bool __eq_wrapper__(const Bnd_Range  other) {
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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param theOther:
	:type theOther: Bnd_Sphere
	:rtype: None") Add;
		void Add (const Bnd_Sphere & theOther);

		/****************** Bnd_Sphere ******************/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "* Empty constructor
	:rtype: None") Bnd_Sphere;
		 Bnd_Sphere ();

		/****************** Bnd_Sphere ******************/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "* Constructor of a definite sphere
	:param theCntr:
	:type theCntr: gp_XYZ
	:param theRad:
	:type theRad: float
	:param theU:
	:type theU: int
	:param theV:
	:type theV: int
	:rtype: None") Bnd_Sphere;
		 Bnd_Sphere (const gp_XYZ & theCntr,const Standard_Real theRad,const Standard_Integer theU,const Standard_Integer theV);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Returns center of sphere object
	:rtype: gp_XYZ") Center;
		const gp_XYZ  Center ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", ":param theNode:
	:type theNode: gp_XYZ
	:rtype: float") Distance;
		Standard_Real Distance (const gp_XYZ & theNode);

		/****************** Distances ******************/
		%feature("compactdefaultargs") Distances;
		%feature("autodoc", "* Calculate and return minimal and maximal distance to sphere. NOTE: This function is tightly optimized; any modifications may affect performance!
	:param theXYZ:
	:type theXYZ: gp_XYZ
	:param theMin:
	:type theMin: float
	:param theMax:
	:type theMax: float
	:rtype: None") Distances;
		void Distances (const gp_XYZ & theXYZ,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", ":param theOther:
	:type theOther: Bnd_Sphere
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const Bnd_Sphere & theOther);

		/****************** IsOut ******************/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", ":param thePnt:
	:type thePnt: gp_XYZ
	:param theMaxDist:
	:type theMaxDist: float
	:rtype: bool") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt,Standard_Real &OutValue);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Returns validity status, indicating that this sphere corresponds to a real entity
	:rtype: bool") IsValid;
		Standard_Boolean IsValid ();

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Projects a point on entity. Returns true if success
	:param theNode:
	:type theNode: gp_XYZ
	:param theProjNode:
	:type theProjNode: gp_XYZ
	:param theDist:
	:type theDist: float
	:param theInside:
	:type theInside: bool
	:rtype: bool") Project;
		Standard_Boolean Project (const gp_XYZ & theNode,gp_XYZ & theProjNode,Standard_Real &OutValue,Standard_Boolean &OutValue);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the radius value
	:rtype: float") Radius;
		Standard_Real Radius ();

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", ":param isValid:
	:type isValid: bool
	:rtype: None") SetValid;
		void SetValid (const Standard_Boolean isValid);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", ":param theNode:
	:type theNode: gp_XYZ
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_XYZ & theNode);

		/****************** SquareDistances ******************/
		%feature("compactdefaultargs") SquareDistances;
		%feature("autodoc", "* Calculate and return minimal and maximal distance to sphere. NOTE: This function is tightly optimized; any modifications may affect performance!
	:param theXYZ:
	:type theXYZ: gp_XYZ
	:param theMin:
	:type theMin: float
	:param theMax:
	:type theMax: float
	:rtype: None") SquareDistances;
		void SquareDistances (const gp_XYZ & theXYZ,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SquareExtent ******************/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", ":rtype: float") SquareExtent;
		Standard_Real SquareExtent ();

		/****************** U ******************/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "* Returns the U parameter on shape
	:rtype: int") U;
		Standard_Integer U ();

		/****************** V ******************/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "* Returns the V parameter on shape
	:rtype: int") V;
		Standard_Integer V ();

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
		%feature("autodoc", "* @name Bnd_Box to BVH_Box conversion Converts the given Bnd_Box2d to BVH_Box
	:param theBox:
	:type theBox: Bnd_Box2d
	:rtype: BVH_Box<float, 2>") Bnd2BVH;
		static BVH_Box<Standard_Real, 2> Bnd2BVH (const Bnd_Box2d & theBox);

		/****************** Bnd2BVH ******************/
		%feature("compactdefaultargs") Bnd2BVH;
		%feature("autodoc", "* Converts the given Bnd_Box to BVH_Box
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: BVH_Box<float, 3>") Bnd2BVH;
		static BVH_Box<Standard_Real, 3> Bnd2BVH (const Bnd_Box & theBox);

};


%extend Bnd_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class Bnd_HArray1OfBox : public  Bnd_Array1OfBox, public Standard_Transient {
  public:
    Bnd_HArray1OfBox(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfBox(const Standard_Integer theLower, const Standard_Integer theUpper, const  Bnd_Array1OfBox::value_type& theValue);
    Bnd_HArray1OfBox(const  Bnd_Array1OfBox& theOther);
    const  Bnd_Array1OfBox& Array1();
     Bnd_Array1OfBox& ChangeArray1();
};
%make_alias(Bnd_HArray1OfBox)


class Bnd_HArray1OfSphere : public  Bnd_Array1OfSphere, public Standard_Transient {
  public:
    Bnd_HArray1OfSphere(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfSphere(const Standard_Integer theLower, const Standard_Integer theUpper, const  Bnd_Array1OfSphere::value_type& theValue);
    Bnd_HArray1OfSphere(const  Bnd_Array1OfSphere& theOther);
    const  Bnd_Array1OfSphere& Array1();
     Bnd_Array1OfSphere& ChangeArray1();
};
%make_alias(Bnd_HArray1OfSphere)


class Bnd_HArray1OfBox2d : public  Bnd_Array1OfBox2d, public Standard_Transient {
  public:
    Bnd_HArray1OfBox2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfBox2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  Bnd_Array1OfBox2d::value_type& theValue);
    Bnd_HArray1OfBox2d(const  Bnd_Array1OfBox2d& theOther);
    const  Bnd_Array1OfBox2d& Array1();
     Bnd_Array1OfBox2d& ChangeArray1();
};
%make_alias(Bnd_HArray1OfBox2d)


/* harray2 classes */
/* hsequence classes */
