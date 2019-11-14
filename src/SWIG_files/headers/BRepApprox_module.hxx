#ifndef BREPAPPROX_HXX
#define BREPAPPROX_HXX

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

#include<BRepApprox_Approx.hxx>
#include<BRepApprox_ApproxLine.hxx>
#include<BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox.hxx>
#include<BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_MyBSplGradientOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_MyGradientOfTheComputeLineBezierOfApprox.hxx>
#include<BRepApprox_MyGradientbisOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox.hxx>
#include<BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox.hxx>
#include<BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox.hxx>
#include<BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox.hxx>
#include<BRepApprox_TheComputeLineBezierOfApprox.hxx>
#include<BRepApprox_TheComputeLineOfApprox.hxx>
#include<BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox.hxx>
#include<BRepApprox_TheImpPrmSvSurfacesOfApprox.hxx>
#include<BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox.hxx>
#include<BRepApprox_TheMultiLineOfApprox.hxx>
#include<BRepApprox_TheMultiLineToolOfApprox.hxx>
#include<BRepApprox_ThePrmPrmSvSurfacesOfApprox.hxx>
#include<BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox.hxx>

#endif // BREPAPPROX_HXX
