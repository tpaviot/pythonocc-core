#ifndef EXTREMA_HXX
#define EXTREMA_HXX

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

#include<Extrema_Array1OfPOnCurv.hxx>
#include<Extrema_Array1OfPOnCurv2d.hxx>
#include<Extrema_Array1OfPOnSurf.hxx>
#include<Extrema_Array2OfPOnCurv.hxx>
#include<Extrema_Array2OfPOnCurv2d.hxx>
#include<Extrema_Array2OfPOnSurf.hxx>
#include<Extrema_Array2OfPOnSurfParams.hxx>
#include<Extrema_CCLocFOfLocECC.hxx>
#include<Extrema_CCLocFOfLocECC2d.hxx>
#include<Extrema_Curve2dTool.hxx>
#include<Extrema_CurveTool.hxx>
#include<Extrema_ECC.hxx>
#include<Extrema_ECC2d.hxx>
#include<Extrema_ELPCOfLocateExtPC.hxx>
#include<Extrema_ELPCOfLocateExtPC2d.hxx>
#include<Extrema_EPCOfELPCOfLocateExtPC.hxx>
#include<Extrema_EPCOfELPCOfLocateExtPC2d.hxx>
#include<Extrema_EPCOfExtPC.hxx>
#include<Extrema_EPCOfExtPC2d.hxx>
#include<Extrema_ElementType.hxx>
#include<Extrema_ExtAlgo.hxx>
#include<Extrema_ExtCC.hxx>
#include<Extrema_ExtCC2d.hxx>
#include<Extrema_ExtCS.hxx>
#include<Extrema_ExtElC.hxx>
#include<Extrema_ExtElC2d.hxx>
#include<Extrema_ExtElCS.hxx>
#include<Extrema_ExtElSS.hxx>
#include<Extrema_ExtFlag.hxx>
#include<Extrema_ExtPC.hxx>
#include<Extrema_ExtPC2d.hxx>
#include<Extrema_ExtPElC.hxx>
#include<Extrema_ExtPElC2d.hxx>
#include<Extrema_ExtPElS.hxx>
#include<Extrema_ExtPExtS.hxx>
#include<Extrema_ExtPRevS.hxx>
#include<Extrema_ExtPS.hxx>
#include<Extrema_ExtSS.hxx>
#include<Extrema_FuncExtCS.hxx>
#include<Extrema_FuncExtSS.hxx>
#include<Extrema_FuncPSDist.hxx>
#include<Extrema_FuncPSNorm.hxx>
#include<Extrema_GenExtCS.hxx>
#include<Extrema_GenExtPS.hxx>
#include<Extrema_GenExtSS.hxx>
#include<Extrema_GenLocateExtCS.hxx>
#include<Extrema_GenLocateExtPS.hxx>
#include<Extrema_GenLocateExtSS.hxx>
#include<Extrema_GlobOptFuncCC.hxx>
#include<Extrema_GlobOptFuncCS.hxx>
#include<Extrema_HArray1OfPOnCurv.hxx>
#include<Extrema_HArray1OfPOnCurv2d.hxx>
#include<Extrema_HArray1OfPOnSurf.hxx>
#include<Extrema_HArray2OfPOnCurv.hxx>
#include<Extrema_HArray2OfPOnCurv2d.hxx>
#include<Extrema_HArray2OfPOnSurf.hxx>
#include<Extrema_HArray2OfPOnSurfParams.hxx>
#include<Extrema_HUBTreeOfSphere.hxx>
#include<Extrema_LocECC.hxx>
#include<Extrema_LocECC2d.hxx>
#include<Extrema_LocEPCOfLocateExtPC.hxx>
#include<Extrema_LocEPCOfLocateExtPC2d.hxx>
#include<Extrema_LocateExtCC.hxx>
#include<Extrema_LocateExtCC2d.hxx>
#include<Extrema_LocateExtPC.hxx>
#include<Extrema_LocateExtPC2d.hxx>
#include<Extrema_PCFOfEPCOfELPCOfLocateExtPC.hxx>
#include<Extrema_PCFOfEPCOfELPCOfLocateExtPC2d.hxx>
#include<Extrema_PCFOfEPCOfExtPC.hxx>
#include<Extrema_PCFOfEPCOfExtPC2d.hxx>
#include<Extrema_PCLocFOfLocEPCOfLocateExtPC.hxx>
#include<Extrema_PCLocFOfLocEPCOfLocateExtPC2d.hxx>
#include<Extrema_POnCurv.hxx>
#include<Extrema_POnCurv2d.hxx>
#include<Extrema_POnSurf.hxx>
#include<Extrema_POnSurfParams.hxx>
#include<Extrema_SequenceOfPOnCurv.hxx>
#include<Extrema_SequenceOfPOnCurv2d.hxx>
#include<Extrema_SequenceOfPOnSurf.hxx>

#endif // EXTREMA_HXX
