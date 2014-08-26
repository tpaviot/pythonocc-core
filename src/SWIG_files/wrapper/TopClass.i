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
%module TopClass

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

%include TopClass_required_python_modules.i
%include TopClass_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TopClass_Intersection3d;
class TopClass_Intersection3d {
	public:
		%feature("autodoc", "Args:
	L(gp_Lin)
	Prm(Standard_Real)
	Tol(Standard_Real)
	Face(TopoDS_Face)

Returns:
	virtual void

Perform the intersection between the  
         segment L(0) ... L(Prm) and the Face <Face>.  
 
         Only the point with the smallest parameter on the  
         line is returned.  
 
         The Tolerance <Tol> is used to determine if the  
         first point of the segment is near the face. In  
         that case, the parameter of the intersection point  
         on the line can be a negative value (greater than -Tol).") Perform;
		virtual void Perform (const gp_Lin & L,const Standard_Real Prm,const Standard_Real Tol,const TopoDS_Face & Face);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

True is returned when the intersection have been computed.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

True is returned if a point has been found.") HasAPoint;
		virtual Standard_Boolean HasAPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  IntCurveSurface_IntersectionPoint

Returns the Intersection Point.") Point;
		virtual const IntCurveSurface_IntersectionPoint & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopAbs_State

Returns the state of the point on the face.  
         The values can be either TopAbs_IN  
            ( the point is in the face)  
          or TopAbs_ON  
            ( the point is on a boudary of the face).") State;
		virtual TopAbs_State State ();
};


%feature("shadow") TopClass_Intersection3d::~TopClass_Intersection3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopClass_Intersection3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopClass_SolidExplorer;
class TopClass_SolidExplorer {
	public:
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	virtual Standard_Boolean

Should  return  True  if the  point  is  outside a  
         bounding volume of the shape.") Reject;
		virtual Standard_Boolean Reject (const gp_Pnt & P);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	L(gp_Lin)
	Par(Standard_Real)

Returns:
	virtual void

Returns  in <L>, <Par>  a segment having at least  
         one  intersection  with  the  shape  boundary  to  
         compute  intersections.") Segment;
		virtual void Segment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	L(gp_Lin)
	Par(Standard_Real)

Returns:
	virtual void

Returns  in <L>, <Par>  a segment having at least  
         one  intersection  with  the  shape  boundary  to  
         compute  intersections.  
 
         The First Call to this method returns a line which  
         point to a point of the first face of the shape.  
         The Second Call provide a line to the second face  
         and so on.  
 
         if the method is called N times on a shape with F  
         faces (N>F) the line point to other points on the  
         face 1,2,3 ... N") OtherSegment;
		virtual void OtherSegment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Starts an exploration of the shells.") InitShell;
		virtual void InitShell ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if there is  a current shell.") MoreShells;
		virtual Standard_Boolean MoreShells ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Sets the explorer  to the  next  shell and  returns  
         False if there are no more wires.") NextShell;
		virtual void NextShell ();
		%feature("autodoc", "Args:
	L(gp_Lin)
	Par(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns True  if the shell  bounding volume does not  
         intersect the segment.") RejectShell;
		virtual Standard_Boolean RejectShell (const gp_Lin & L,const Standard_Real Par);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Starts an exploration of the faces.") InitFace;
		virtual void InitFace ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if there is  a current face.") MoreFaces;
		virtual Standard_Boolean MoreFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Sets the explorer  to the  next  face and  returns  
         False if there are no more wires.") NextFace;
		virtual void NextFace ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Face

Returns the current face.") CurrentFace;
		virtual TopoDS_Face CurrentFace ();
		%feature("autodoc", "Args:
	L(gp_Lin)
	Par(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns True  if the face  bounding volume does not  
         intersect the segment.") RejectFace;
		virtual Standard_Boolean RejectFace (const gp_Lin & L,const Standard_Real Par);
};


%feature("shadow") TopClass_SolidExplorer::~TopClass_SolidExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopClass_SolidExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
