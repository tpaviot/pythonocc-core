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
%{
#include<NIS_Allocator.hxx>
#include<NIS_Drawer.hxx>
#include<NIS_DrawList.hxx>
#include<NIS_InteractiveContext.hxx>
#include<NIS_InteractiveObject.hxx>
#include<NIS_ObjectsIterator.hxx>
#include<NIS_SelectFilter.hxx>
#include<NIS_Surface.hxx>
#include<NIS_SurfaceDrawer.hxx>
#include<NIS_Triangulated.hxx>
#include<NIS_TriangulatedDrawer.hxx>
#include<NIS_View.hxx>
#include<NCollection_AccAllocator.hxx>
#include<NCollection_AlignedAllocator.hxx>
#include<NCollection_Array1.hxx>
#include<NCollection_Array2.hxx>
#include<NCollection_BaseAllocator.hxx>
#include<NCollection_BaseList.hxx>
#include<NCollection_BaseMap.hxx>
#include<NCollection_BaseVector.hxx>
#include<NCollection_Buffer.hxx>
#include<NCollection_Comparator.hxx>
#include<NCollection_DefaultHasher.hxx>
#include<NCollection_DefineAlloc.hxx>
#include<NCollection_DefineArray1.hxx>
#include<NCollection_DefineArray2.hxx>
#include<NCollection_DefineDataMap.hxx>
#include<NCollection_DefineDoubleMap.hxx>
#include<NCollection_DefineHArray1.hxx>
#include<NCollection_DefineHArray2.hxx>
#include<NCollection_DefineHSequence.hxx>
#include<NCollection_DefineIndexedDataMap.hxx>
#include<NCollection_DefineIndexedMap.hxx>
#include<NCollection_DefineList.hxx>
#include<NCollection_DefineMap.hxx>
#include<NCollection_DefineSequence.hxx>
#include<NCollection_DefineVector.hxx>
#include<NCollection_Handle.hxx>
#include<NCollection_HArray1.hxx>
#include<NCollection_HArray2.hxx>
#include<NCollection_HeapAllocator.hxx>
#include<NCollection_HSequence.hxx>
#include<NCollection_IncAllocator.hxx>
#include<NCollection_List.hxx>
#include<NCollection_ListNode.hxx>
#include<NCollection_LocalArray.hxx>
#include<NCollection_Mat4.hxx>
#include<NCollection_QuickSort.hxx>
#include<NCollection_Sequence.hxx>
#include<NCollection_SparseArray.hxx>
#include<NCollection_SparseArrayBase.hxx>
#include<NCollection_StdAllocator.hxx>
#include<NCollection_String.hxx>
#include<NCollection_TListIterator.hxx>
#include<NCollection_TListNode.hxx>
#include<NCollection_TypeDef.hxx>
#include<NCollection_UBTree.hxx>
#include<NCollection_UBTreeFiller.hxx>
#include<NCollection_UtfIterator.hxx>
#include<NCollection_UtfString.hxx>
#include<NCollection_Vec2.hxx>
#include<NCollection_Vec3.hxx>
#include<NCollection_Vec4.hxx>
#include<NCollection_Vector.hxx>
#include<NCollection_WinHeapAllocator.hxx>
#include<Standard.hxx>
#include<Standard_AbortiveTransaction.hxx>
#include<Standard_Address.hxx>
#include<Standard_AncestorIterator.hxx>
#include<Standard_Assert.hxx>
#include<Standard_Atomic.hxx>
#include<Standard_Boolean.hxx>
#include<Standard_Byte.hxx>
#include<Standard_Character.hxx>
#include<Standard_ConstructionError.hxx>
#include<Standard_CString.hxx>
#include<Standard_DefineAlloc.hxx>
#include<Standard_DefineException.hxx>
#include<Standard_DefineHandle.hxx>
#include<Standard_DimensionError.hxx>
#include<Standard_DimensionMismatch.hxx>
#include<Standard_DivideByZero.hxx>
#include<Standard_DomainError.hxx>
#include<Standard_ErrorHandler.hxx>
#include<Standard_ErrorHandlerCallback.hxx>
#include<Standard_ExtCharacter.hxx>
#include<Standard_ExtString.hxx>
#include<Standard_Failure.hxx>
#include<Standard_GUID.hxx>
#include<Standard_HandlerStatus.hxx>
#include<Standard_ImmutableObject.hxx>
#include<Standard_Integer.hxx>
#include<Standard_InternalType.hxx>
#include<Standard_IStream.hxx>
#include<Standard_JmpBuf.hxx>
#include<Standard_KindOfType.hxx>
#include<Standard_LicenseError.hxx>
#include<Standard_LicenseNotFound.hxx>
#include<Standard_Macro.hxx>
#include<Standard_math.hxx>
#include<Standard_MMgrOpt.hxx>
#include<Standard_MMgrRaw.hxx>
#include<Standard_MMgrRoot.hxx>
#include<Standard_MMgrTBBalloc.hxx>
#include<Standard_MultiplyDefined.hxx>
#include<Standard_Mutex.hxx>
#include<Standard_NegativeValue.hxx>
#include<Standard_NoMoreObject.hxx>
#include<Standard_NoSuchObject.hxx>
#include<Standard_NotImplemented.hxx>
#include<Standard_NullObject.hxx>
#include<Standard_NullValue.hxx>
#include<Standard_NumericError.hxx>
#include<Standard_OStream.hxx>
#include<Standard_OutOfMemory.hxx>
#include<Standard_OutOfRange.hxx>
#include<Standard_Overflow.hxx>
#include<Standard_PByte.hxx>
#include<Standard_PCharacter.hxx>
#include<Standard_PErrorHandler.hxx>
#include<Standard_Persistent.hxx>
#include<Standard_Persistent_proto.hxx>
#include<Standard_PExtCharacter.hxx>
#include<Standard_PrimitiveTypes.hxx>
#include<Standard_ProgramError.hxx>
#include<Standard_RangeError.hxx>
#include<Standard_Real.hxx>
#include<Standard_ShortReal.hxx>
#include<Standard_Size.hxx>
#include<Standard_SStream.hxx>
#include<Standard_Storable.hxx>
#include<Standard_Stream.hxx>
#include<Standard_ThreadId.hxx>
#include<Standard_Time.hxx>
#include<Standard_TooManyUsers.hxx>
#include<Standard_Transient.hxx>
#include<Standard_Transient_proto.hxx>
#include<Standard_Type.hxx>
#include<Standard_TypeDef.hxx>
#include<Standard_TypeMismatch.hxx>
#include<Standard_Underflow.hxx>
#include<Standard_UUID.hxx>
#include<Standard_Version.hxx>
#include<Standard_WayOfLife.hxx>
#include<Standard_values.h>
#include<Bnd_Array1OfBox.hxx>
#include<Bnd_Array1OfBox2d.hxx>
#include<Bnd_Array1OfSphere.hxx>
#include<Bnd_B2d.hxx>
#include<Bnd_B2f.hxx>
#include<Bnd_B3d.hxx>
#include<Bnd_B3f.hxx>
#include<Bnd_BoundSortBox.hxx>
#include<Bnd_BoundSortBox2d.hxx>
#include<Bnd_Box.hxx>
#include<Bnd_Box2d.hxx>
#include<Bnd_HArray1OfBox.hxx>
#include<Bnd_HArray1OfBox2d.hxx>
#include<Bnd_HArray1OfSphere.hxx>
#include<Bnd_SeqOfBox.hxx>
#include<Bnd_SequenceNodeOfSeqOfBox.hxx>
#include<Bnd_Sphere.hxx>
#include<TColStd_Array1OfAsciiString.hxx>
#include<TColStd_Array1OfBoolean.hxx>
#include<TColStd_Array1OfByte.hxx>
#include<TColStd_Array1OfCharacter.hxx>
#include<TColStd_Array1OfExtendedString.hxx>
#include<TColStd_Array1OfInteger.hxx>
#include<TColStd_Array1OfListOfInteger.hxx>
#include<TColStd_Array1OfReal.hxx>
#include<TColStd_Array1OfTransient.hxx>
#include<TColStd_Array2OfBoolean.hxx>
#include<TColStd_Array2OfCharacter.hxx>
#include<TColStd_Array2OfInteger.hxx>
#include<TColStd_Array2OfReal.hxx>
#include<TColStd_Array2OfTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapOfIntegerReal.hxx>
#include<TColStd_DataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapOfStringInteger.hxx>
#include<TColStd_DataMapOfTransientTransient.hxx>
#include<TColStd_HArray1OfAsciiString.hxx>
#include<TColStd_HArray1OfBoolean.hxx>
#include<TColStd_HArray1OfByte.hxx>
#include<TColStd_HArray1OfCharacter.hxx>
#include<TColStd_HArray1OfExtendedString.hxx>
#include<TColStd_HArray1OfInteger.hxx>
#include<TColStd_HArray1OfListOfInteger.hxx>
#include<TColStd_HArray1OfReal.hxx>
#include<TColStd_HArray1OfTransient.hxx>
#include<TColStd_HArray2OfBoolean.hxx>
#include<TColStd_HArray2OfCharacter.hxx>
#include<TColStd_HArray2OfInteger.hxx>
#include<TColStd_HArray2OfReal.hxx>
#include<TColStd_HArray2OfTransient.hxx>
#include<TColStd_HPackedMapOfInteger.hxx>
#include<TColStd_HSequenceOfAsciiString.hxx>
#include<TColStd_HSequenceOfExtendedString.hxx>
#include<TColStd_HSequenceOfHAsciiString.hxx>
#include<TColStd_HSequenceOfHExtendedString.hxx>
#include<TColStd_HSequenceOfInteger.hxx>
#include<TColStd_HSequenceOfReal.hxx>
#include<TColStd_HSequenceOfTransient.hxx>
#include<TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfReal.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfTransient.hxx>
#include<TColStd_IndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapOfReal.hxx>
#include<TColStd_IndexedMapOfTransient.hxx>
#include<TColStd_ListIteratorOfListOfAsciiString.hxx>
#include<TColStd_ListIteratorOfListOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfReal.hxx>
#include<TColStd_ListIteratorOfListOfTransient.hxx>
#include<TColStd_ListNodeOfListOfAsciiString.hxx>
#include<TColStd_ListNodeOfListOfInteger.hxx>
#include<TColStd_ListNodeOfListOfReal.hxx>
#include<TColStd_ListNodeOfListOfTransient.hxx>
#include<TColStd_ListOfAsciiString.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<TColStd_ListOfReal.hxx>
#include<TColStd_ListOfTransient.hxx>
#include<TColStd_MapIntegerHasher.hxx>
#include<TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfInteger.hxx>
#include<TColStd_MapIteratorOfMapOfReal.hxx>
#include<TColStd_MapIteratorOfMapOfTransient.hxx>
#include<TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include<TColStd_MapOfAsciiString.hxx>
#include<TColStd_MapOfInteger.hxx>
#include<TColStd_MapOfReal.hxx>
#include<TColStd_MapOfTransient.hxx>
#include<TColStd_MapRealHasher.hxx>
#include<TColStd_MapTransientHasher.hxx>
#include<TColStd_PackedMapOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAddress.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfBoolean.hxx>
#include<TColStd_SequenceNodeOfSequenceOfExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfReal.hxx>
#include<TColStd_SequenceNodeOfSequenceOfTransient.hxx>
#include<TColStd_SequenceOfAddress.hxx>
#include<TColStd_SequenceOfAsciiString.hxx>
#include<TColStd_SequenceOfBoolean.hxx>
#include<TColStd_SequenceOfExtendedString.hxx>
#include<TColStd_SequenceOfHAsciiString.hxx>
#include<TColStd_SequenceOfHExtendedString.hxx>
#include<TColStd_SequenceOfInteger.hxx>
#include<TColStd_SequenceOfReal.hxx>
#include<TColStd_SequenceOfTransient.hxx>
#include<TColStd_StdMapNodeOfMapOfAsciiString.hxx>
#include<TColStd_StdMapNodeOfMapOfInteger.hxx>
#include<TColStd_StdMapNodeOfMapOfReal.hxx>
#include<TColStd_StdMapNodeOfMapOfTransient.hxx>
#include<gp.hxx>
#include<gp_Ax1.hxx>
#include<gp_Ax2.hxx>
#include<gp_Ax22d.hxx>
#include<gp_Ax2d.hxx>
#include<gp_Ax3.hxx>
#include<gp_Circ.hxx>
#include<gp_Circ2d.hxx>
#include<gp_Cone.hxx>
#include<gp_Cylinder.hxx>
#include<gp_Dir.hxx>
#include<gp_Dir2d.hxx>
#include<gp_Elips.hxx>
#include<gp_Elips2d.hxx>
#include<gp_EulerSequence.hxx>
#include<gp_GTrsf.hxx>
#include<gp_GTrsf2d.hxx>
#include<gp_Hypr.hxx>
#include<gp_Hypr2d.hxx>
#include<gp_Lin.hxx>
#include<gp_Lin2d.hxx>
#include<gp_Mat.hxx>
#include<gp_Mat2d.hxx>
#include<gp_Parab.hxx>
#include<gp_Parab2d.hxx>
#include<gp_Pln.hxx>
#include<gp_Pnt.hxx>
#include<gp_Pnt2d.hxx>
#include<gp_Quaternion.hxx>
#include<gp_QuaternionNLerp.hxx>
#include<gp_QuaternionSLerp.hxx>
#include<gp_Sphere.hxx>
#include<gp_Torus.hxx>
#include<gp_Trsf.hxx>
#include<gp_Trsf2d.hxx>
#include<gp_TrsfForm.hxx>
#include<gp_Vec.hxx>
#include<gp_Vec2d.hxx>
#include<gp_VectorWithNullMagnitude.hxx>
#include<gp_XY.hxx>
#include<gp_XYZ.hxx>
#include<V3d.hxx>
#include<V3d_AmbientLight.hxx>
#include<V3d_BadValue.hxx>
#include<V3d_CircularGrid.hxx>
#include<V3d_ColorScale.hxx>
#include<V3d_ColorScaleLayerItem.hxx>
#include<V3d_Coordinate.hxx>
#include<V3d_DirectionalLight.hxx>
#include<V3d_LayerMgr.hxx>
#include<V3d_LayerMgrPointer.hxx>
#include<V3d_Light.hxx>
#include<V3d_ListOfTransient.hxx>
#include<V3d_Parameter.hxx>
#include<V3d_Plane.hxx>
#include<V3d_PositionalLight.hxx>
#include<V3d_PositionLight.hxx>
#include<V3d_RectangularGrid.hxx>
#include<V3d_SpotLight.hxx>
#include<V3d_StereoDumpOptions.hxx>
#include<V3d_TypeOfAxe.hxx>
#include<V3d_TypeOfBackfacingModel.hxx>
#include<V3d_TypeOfLight.hxx>
#include<V3d_TypeOfOrientation.hxx>
#include<V3d_TypeOfPickCamera.hxx>
#include<V3d_TypeOfPickLight.hxx>
#include<V3d_TypeOfRepresentation.hxx>
#include<V3d_TypeOfShadingModel.hxx>
#include<V3d_TypeOfSurfaceDetail.hxx>
#include<V3d_TypeOfUpdate.hxx>
#include<V3d_TypeOfView.hxx>
#include<V3d_TypeOfVisualization.hxx>
#include<V3d_TypeOfZclipping.hxx>
#include<V3d_UnMapped.hxx>
#include<V3d_View.hxx>
#include<V3d_Viewer.hxx>
#include<V3d_ViewerPointer.hxx>
#include<V3d_ViewPointer.hxx>
#include<Aspect_AspectFillArea.hxx>
#include<Aspect_AspectFillAreaDefinitionError.hxx>
#include<Aspect_AspectLine.hxx>
#include<Aspect_AspectLineDefinitionError.hxx>
#include<Aspect_AspectMarker.hxx>
#include<Aspect_AspectMarkerDefinitionError.hxx>
#include<Aspect_Background.hxx>
#include<Aspect_BadAccess.hxx>
#include<Aspect_CircularGrid.hxx>
#include<Aspect_CLayer2d.hxx>
#include<Aspect_ColorScale.hxx>
#include<Aspect_Convert.hxx>
#include<Aspect_Display.hxx>
#include<Aspect_DisplayConnectionDefinitionError.hxx>
#include<Aspect_Drawable.hxx>
#include<Aspect_DriverDefinitionError.hxx>
#include<Aspect_FillMethod.hxx>
#include<Aspect_GenId.hxx>
#include<Aspect_GradientBackground.hxx>
#include<Aspect_GradientFillMethod.hxx>
#include<Aspect_GraphicCallbackProc.hxx>
#include<Aspect_GraphicDeviceDefinitionError.hxx>
#include<Aspect_Grid.hxx>
#include<Aspect_GridDrawMode.hxx>
#include<Aspect_GridType.hxx>
#include<Aspect_Handle.hxx>
#include<Aspect_HatchStyle.hxx>
#include<Aspect_IdentDefinitionError.hxx>
#include<Aspect_InteriorStyle.hxx>
#include<Aspect_PolygonOffsetMode.hxx>
#include<Aspect_PrintAlgo.hxx>
#include<Aspect_RectangularGrid.hxx>
#include<Aspect_RenderingContext.hxx>
#include<Aspect_SequenceNodeOfSequenceOfColor.hxx>
#include<Aspect_SequenceOfColor.hxx>
#include<Aspect_TypeOfColorScaleData.hxx>
#include<Aspect_TypeOfColorScaleOrientation.hxx>
#include<Aspect_TypeOfColorScalePosition.hxx>
#include<Aspect_TypeOfConstraint.hxx>
#include<Aspect_TypeOfDeflection.hxx>
#include<Aspect_TypeOfDisplayText.hxx>
#include<Aspect_TypeOfDrawMode.hxx>
#include<Aspect_TypeOfEdge.hxx>
#include<Aspect_TypeOfFacingModel.hxx>
#include<Aspect_TypeOfHighlightMethod.hxx>
#include<Aspect_TypeOfLayer.hxx>
#include<Aspect_TypeOfLine.hxx>
#include<Aspect_TypeOfMarker.hxx>
#include<Aspect_TypeOfPrimitive.hxx>
#include<Aspect_TypeOfResize.hxx>
#include<Aspect_TypeOfStyleText.hxx>
#include<Aspect_TypeOfTriedronEcho.hxx>
#include<Aspect_TypeOfTriedronPosition.hxx>
#include<Aspect_TypeOfUpdate.hxx>
#include<Aspect_Units.hxx>
#include<Aspect_WidthOfLine.hxx>
#include<Aspect_Window.hxx>
#include<Aspect_WindowDefinitionError.hxx>
#include<Aspect_WindowError.hxx>
#include<Aspect_XAtom.hxx>
#include<Quantity_AbsorbedDose.hxx>
#include<Quantity_Acceleration.hxx>
#include<Quantity_AcousticIntensity.hxx>
#include<Quantity_Activity.hxx>
#include<Quantity_Admittance.hxx>
#include<Quantity_AmountOfSubstance.hxx>
#include<Quantity_AngularVelocity.hxx>
#include<Quantity_Area.hxx>
#include<Quantity_Array1OfCoefficient.hxx>
#include<Quantity_Array1OfColor.hxx>
#include<Quantity_Array2OfColor.hxx>
#include<Quantity_Capacitance.hxx>
#include<Quantity_Coefficient.hxx>
#include<Quantity_CoefficientOfExpansion.hxx>
#include<Quantity_Color.hxx>
#include<Quantity_ColorDefinitionError.hxx>
#include<Quantity_Concentration.hxx>
#include<Quantity_Conductivity.hxx>
#include<Quantity_Constant.hxx>
#include<Quantity_Consumption.hxx>
#include<Quantity_Content.hxx>
#include<Quantity_Convert.hxx>
#include<Quantity_Date.hxx>
#include<Quantity_DateDefinitionError.hxx>
#include<Quantity_Density.hxx>
#include<Quantity_DoseEquivalent.hxx>
#include<Quantity_ElectricCapacitance.hxx>
#include<Quantity_ElectricCharge.hxx>
#include<Quantity_ElectricCurrent.hxx>
#include<Quantity_ElectricFieldStrength.hxx>
#include<Quantity_ElectricPotential.hxx>
#include<Quantity_Energy.hxx>
#include<Quantity_Enthalpy.hxx>
#include<Quantity_Entropy.hxx>
#include<Quantity_Factor.hxx>
#include<Quantity_Force.hxx>
#include<Quantity_Frequency.hxx>
#include<Quantity_HArray1OfColor.hxx>
#include<Quantity_Illuminance.hxx>
#include<Quantity_Impedance.hxx>
#include<Quantity_Index.hxx>
#include<Quantity_Inductance.hxx>
#include<Quantity_KinematicViscosity.hxx>
#include<Quantity_KineticMoment.hxx>
#include<Quantity_Length.hxx>
#include<Quantity_Luminance.hxx>
#include<Quantity_LuminousEfficacity.hxx>
#include<Quantity_LuminousExposition.hxx>
#include<Quantity_LuminousFlux.hxx>
#include<Quantity_LuminousIntensity.hxx>
#include<Quantity_MagneticFieldStrength.hxx>
#include<Quantity_MagneticFlux.hxx>
#include<Quantity_MagneticFluxDensity.hxx>
#include<Quantity_Mass.hxx>
#include<Quantity_MassFlow.hxx>
#include<Quantity_MolarConcentration.hxx>
#include<Quantity_Molarity.hxx>
#include<Quantity_MolarMass.hxx>
#include<Quantity_MolarVolume.hxx>
#include<Quantity_MomentOfAForce.hxx>
#include<Quantity_MomentOfInertia.hxx>
#include<Quantity_Momentum.hxx>
#include<Quantity_NameOfColor.hxx>
#include<Quantity_Normality.hxx>
#include<Quantity_Parameter.hxx>
#include<Quantity_Period.hxx>
#include<Quantity_PeriodDefinitionError.hxx>
#include<Quantity_PhysicalQuantity.hxx>
#include<Quantity_PlaneAngle.hxx>
#include<Quantity_Power.hxx>
#include<Quantity_Pressure.hxx>
#include<Quantity_Quotient.hxx>
#include<Quantity_Rate.hxx>
#include<Quantity_Ratio.hxx>
#include<Quantity_Reluctance.hxx>
#include<Quantity_Resistance.hxx>
#include<Quantity_Resistivity.hxx>
#include<Quantity_Scalaire.hxx>
#include<Quantity_SolidAngle.hxx>
#include<Quantity_SoundIntensity.hxx>
#include<Quantity_SpecificHeatCapacity.hxx>
#include<Quantity_Speed.hxx>
#include<Quantity_SurfaceTension.hxx>
#include<Quantity_Temperature.hxx>
#include<Quantity_ThermalConductivity.hxx>
#include<Quantity_Torque.hxx>
#include<Quantity_TypeOfColor.hxx>
#include<Quantity_Velocity.hxx>
#include<Quantity_Viscosity.hxx>
#include<Quantity_Volume.hxx>
#include<Quantity_VolumeFlow.hxx>
#include<Quantity_Weight.hxx>
#include<Quantity_Work.hxx>
#include<Poly.hxx>
#include<Poly_Array1OfTriangle.hxx>
#include<Poly_CoherentLink.hxx>
#include<Poly_CoherentNode.hxx>
#include<Poly_CoherentTriangle.hxx>
#include<Poly_CoherentTriangulation.hxx>
#include<Poly_CoherentTriPtr.hxx>
#include<Poly_Connect.hxx>
#include<Poly_HArray1OfTriangle.hxx>
#include<Poly_ListOfTriangulation.hxx>
#include<Poly_MakeLoops.hxx>
#include<Poly_Polygon2D.hxx>
#include<Poly_Polygon3D.hxx>
#include<Poly_PolygonOnTriangulation.hxx>
#include<Poly_Triangle.hxx>
#include<Poly_Triangulation.hxx>
#include<TopoDS.hxx>
#include<TopoDS_Builder.hxx>
#include<TopoDS_Compound.hxx>
#include<TopoDS_CompSolid.hxx>
#include<TopoDS_Edge.hxx>
#include<TopoDS_Face.hxx>
#include<TopoDS_FrozenShape.hxx>
#include<TopoDS_HShape.hxx>
#include<TopoDS_Iterator.hxx>
#include<TopoDS_ListIteratorOfListOfShape.hxx>
#include<TopoDS_ListNodeOfListOfShape.hxx>
#include<TopoDS_ListOfShape.hxx>
#include<TopoDS_LockedShape.hxx>
#include<TopoDS_Shape.hxx>
#include<TopoDS_Shell.hxx>
#include<TopoDS_Solid.hxx>
#include<TopoDS_TCompound.hxx>
#include<TopoDS_TCompSolid.hxx>
#include<TopoDS_TEdge.hxx>
#include<TopoDS_TFace.hxx>
#include<TopoDS_TShape.hxx>
#include<TopoDS_TShell.hxx>
#include<TopoDS_TSolid.hxx>
#include<TopoDS_TVertex.hxx>
#include<TopoDS_TWire.hxx>
#include<TopoDS_UnCompatibleShapes.hxx>
#include<TopoDS_Vertex.hxx>
#include<TopoDS_Wire.hxx>
#include<NIS_Allocator.hxx>
#include<NIS_Drawer.hxx>
#include<NIS_DrawList.hxx>
#include<NIS_InteractiveContext.hxx>
#include<NIS_InteractiveObject.hxx>
#include<NIS_ObjectsIterator.hxx>
#include<NIS_SelectFilter.hxx>
#include<NIS_Surface.hxx>
#include<NIS_SurfaceDrawer.hxx>
#include<NIS_Triangulated.hxx>
#include<NIS_TriangulatedDrawer.hxx>
#include<NIS_View.hxx>
#include<TShort_Array1OfShortReal.hxx>
#include<TShort_Array2OfShortReal.hxx>
#include<TShort_HArray1OfShortReal.hxx>
#include<TShort_HArray2OfShortReal.hxx>
#include<TShort_HSequenceOfShortReal.hxx>
#include<TShort_SequenceNodeOfSequenceOfShortReal.hxx>
#include<TShort_SequenceOfShortReal.hxx>
#include<Graphic3d_Array1OfVector.hxx>
#include<Graphic3d_Array1OfVertex.hxx>
#include<Graphic3d_Array2OfVertex.hxx>
#include<Graphic3d_ArrayOfPoints.hxx>
#include<Graphic3d_ArrayOfPolygons.hxx>
#include<Graphic3d_ArrayOfPolylines.hxx>
#include<Graphic3d_ArrayOfPrimitives.hxx>
#include<Graphic3d_ArrayOfQuadrangles.hxx>
#include<Graphic3d_ArrayOfQuadrangleStrips.hxx>
#include<Graphic3d_ArrayOfSegments.hxx>
#include<Graphic3d_ArrayOfTriangleFans.hxx>
#include<Graphic3d_ArrayOfTriangles.hxx>
#include<Graphic3d_ArrayOfTriangleStrips.hxx>
#include<Graphic3d_AspectFillArea3d.hxx>
#include<Graphic3d_AspectLine3d.hxx>
#include<Graphic3d_AspectMarker3d.hxx>
#include<Graphic3d_AspectText3d.hxx>
#include<Graphic3d_AspectTextDefinitionError.hxx>
#include<Graphic3d_BndBox4d.hxx>
#include<Graphic3d_BndBox4f.hxx>
#include<Graphic3d_BoundBuffer.hxx>
#include<Graphic3d_Buffer.hxx>
#include<Graphic3d_BufferType.hxx>
#include<Graphic3d_Camera.hxx>
#include<Graphic3d_CAspectFillArea.hxx>
#include<Graphic3d_CAspectLine.hxx>
#include<Graphic3d_CAspectMarker.hxx>
#include<Graphic3d_CAspectText.hxx>
#include<Graphic3d_CBitFields16.hxx>
#include<Graphic3d_CBitFields20.hxx>
#include<Graphic3d_CBitFields4.hxx>
#include<Graphic3d_CBitFields8.hxx>
#include<Graphic3d_CLight.hxx>
#include<Graphic3d_ClipPlane.hxx>
#include<Graphic3d_CStructure.hxx>
#include<Graphic3d_CStructurePtr.hxx>
#include<Graphic3d_CTexture.hxx>
#include<Graphic3d_CTransPersStruct.hxx>
#include<Graphic3d_CUserDraw.hxx>
#include<Graphic3d_CView.hxx>
#include<Graphic3d_CycleError.hxx>
#include<Graphic3d_DataStructureManager.hxx>
#include<Graphic3d_ExportFormat.hxx>
#include<Graphic3d_GraduatedTrihedron.hxx>
#include<Graphic3d_GraphicDriver.hxx>
#include<Graphic3d_Group.hxx>
#include<Graphic3d_GroupAspect.hxx>
#include<Graphic3d_GroupDefinitionError.hxx>
#include<Graphic3d_HorizontalTextAlignment.hxx>
#include<Graphic3d_HSequenceOfStructure.hxx>
#include<Graphic3d_IndexBuffer.hxx>
#include<Graphic3d_IndexedMapOfAddress.hxx>
#include<Graphic3d_InitialisationError.hxx>
#include<Graphic3d_LevelOfTextureAnisotropy.hxx>
#include<Graphic3d_ListIteratorOfListOfShortReal.hxx>
#include<Graphic3d_ListNodeOfListOfShortReal.hxx>
#include<Graphic3d_ListOfShortReal.hxx>
#include<Graphic3d_MapIteratorOfMapOfStructure.hxx>
#include<Graphic3d_MapOfObject.hxx>
#include<Graphic3d_MapOfStructure.hxx>
#include<Graphic3d_MarkerImage.hxx>
#include<Graphic3d_Mat4.hxx>
#include<Graphic3d_Mat4d.hxx>
#include<Graphic3d_MaterialAspect.hxx>
#include<Graphic3d_MaterialDefinitionError.hxx>
#include<Graphic3d_NameOfMaterial.hxx>
#include<Graphic3d_NameOfTexture1D.hxx>
#include<Graphic3d_NameOfTexture2D.hxx>
#include<Graphic3d_NameOfTextureEnv.hxx>
#include<Graphic3d_NameOfTexturePlane.hxx>
#include<Graphic3d_NListOfHAsciiString.hxx>
#include<Graphic3d_NMapOfTransient.hxx>
#include<Graphic3d_PriorityDefinitionError.hxx>
#include<Graphic3d_PtrFrameBuffer.hxx>
#include<Graphic3d_RenderingMode.hxx>
#include<Graphic3d_RenderingParams.hxx>
#include<Graphic3d_SequenceNodeOfSequenceOfStructure.hxx>
#include<Graphic3d_SequenceOfGroup.hxx>
#include<Graphic3d_SequenceOfHClipPlane.hxx>
#include<Graphic3d_SequenceOfStructure.hxx>
#include<Graphic3d_ShaderObject.hxx>
#include<Graphic3d_ShaderProgram.hxx>
#include<Graphic3d_ShaderVariable.hxx>
#include<Graphic3d_SortType.hxx>
#include<Graphic3d_StereoMode.hxx>
#include<Graphic3d_Structure.hxx>
#include<Graphic3d_StructureDefinitionError.hxx>
#include<Graphic3d_StructureManager.hxx>
#include<Graphic3d_StructureManagerPtr.hxx>
#include<Graphic3d_StructurePtr.hxx>
#include<Graphic3d_TextPath.hxx>
#include<Graphic3d_Texture1D.hxx>
#include<Graphic3d_Texture1Dmanual.hxx>
#include<Graphic3d_Texture1Dsegment.hxx>
#include<Graphic3d_Texture2D.hxx>
#include<Graphic3d_Texture2Dmanual.hxx>
#include<Graphic3d_Texture2Dplane.hxx>
#include<Graphic3d_TextureEnv.hxx>
#include<Graphic3d_TextureMap.hxx>
#include<Graphic3d_TextureParams.hxx>
#include<Graphic3d_TextureRoot.hxx>
#include<Graphic3d_TransformError.hxx>
#include<Graphic3d_TransModeFlags.hxx>
#include<Graphic3d_TypeOfBackground.hxx>
#include<Graphic3d_TypeOfComposition.hxx>
#include<Graphic3d_TypeOfConnection.hxx>
#include<Graphic3d_TypeOfMaterial.hxx>
#include<Graphic3d_TypeOfPolygon.hxx>
#include<Graphic3d_TypeOfPrimitive.hxx>
#include<Graphic3d_TypeOfPrimitiveArray.hxx>
#include<Graphic3d_TypeOfReflection.hxx>
#include<Graphic3d_TypeOfShaderObject.hxx>
#include<Graphic3d_TypeOfStructure.hxx>
#include<Graphic3d_TypeOfTexture.hxx>
#include<Graphic3d_TypeOfTextureFilter.hxx>
#include<Graphic3d_TypeOfTextureMode.hxx>
#include<Graphic3d_Vec.hxx>
#include<Graphic3d_Vec2.hxx>
#include<Graphic3d_Vec3.hxx>
#include<Graphic3d_Vec4.hxx>
#include<Graphic3d_Vector.hxx>
#include<Graphic3d_VectorError.hxx>
#include<Graphic3d_Vertex.hxx>
#include<Graphic3d_VerticalTextAlignment.hxx>
#include<Graphic3d_ViewAffinity.hxx>
#include<Graphic3d_ZLayerId.hxx>
#include<Graphic3d_ZLayerSettings.hxx>
#include<Visual3d_ClipDefinitionError.hxx>
#include<Visual3d_ContextPick.hxx>
#include<Visual3d_ContextPickDefinitionError.hxx>
#include<Visual3d_ContextView.hxx>
#include<Visual3d_DepthCueingDefinitionError.hxx>
#include<Visual3d_HSequenceOfLight.hxx>
#include<Visual3d_HSequenceOfView.hxx>
#include<Visual3d_Layer.hxx>
#include<Visual3d_LayerDefinitionError.hxx>
#include<Visual3d_LayerItem.hxx>
#include<Visual3d_Light.hxx>
#include<Visual3d_LightDefinitionError.hxx>
#include<Visual3d_MapOfZLayerSettings.hxx>
#include<Visual3d_NListOfLayerItem.hxx>
#include<Visual3d_PickError.hxx>
#include<Visual3d_SequenceNodeOfSequenceOfLight.hxx>
#include<Visual3d_SequenceNodeOfSequenceOfView.hxx>
#include<Visual3d_SequenceOfLight.hxx>
#include<Visual3d_SequenceOfView.hxx>
#include<Visual3d_TransformError.hxx>
#include<Visual3d_TypeOfAnswer.hxx>
#include<Visual3d_TypeOfBackfacingModel.hxx>
#include<Visual3d_TypeOfLightSource.hxx>
#include<Visual3d_TypeOfModel.hxx>
#include<Visual3d_TypeOfOrder.hxx>
#include<Visual3d_TypeOfProjection.hxx>
#include<Visual3d_TypeOfSurfaceDetail.hxx>
#include<Visual3d_TypeOfVisualization.hxx>
#include<Visual3d_View.hxx>
#include<Visual3d_ViewDefinitionError.hxx>
#include<Visual3d_ViewManager.hxx>
#include<Visual3d_ViewManagerDefinitionError.hxx>
#include<Visual3d_ViewManagerPtr.hxx>
#include<Visual3d_ViewMappingDefinitionError.hxx>
#include<Visual3d_ViewOrientationDefinitionError.hxx>
#include<Visual3d_ViewPtr.hxx>
#include<Visual3d_ZClippingDefinitionError.hxx>
#include<TopLoc_Datum3D.hxx>
#include<TopLoc_IndexedMapNodeOfIndexedMapOfLocation.hxx>
#include<TopLoc_IndexedMapOfLocation.hxx>
#include<TopLoc_ItemLocation.hxx>
#include<TopLoc_Location.hxx>
#include<TopLoc_MapIteratorOfMapOfLocation.hxx>
#include<TopLoc_MapLocationHasher.hxx>
#include<TopLoc_MapOfLocation.hxx>
#include<TopLoc_SListNodeOfItemLocation.hxx>
#include<TopLoc_SListOfItemLocation.hxx>
#include<TopLoc_StdMapNodeOfMapOfLocation.hxx>
#include<TColgp_Array1OfCirc2d.hxx>
#include<TColgp_Array1OfDir.hxx>
#include<TColgp_Array1OfDir2d.hxx>
#include<TColgp_Array1OfLin2d.hxx>
#include<TColgp_Array1OfPnt.hxx>
#include<TColgp_Array1OfPnt2d.hxx>
#include<TColgp_Array1OfVec.hxx>
#include<TColgp_Array1OfVec2d.hxx>
#include<TColgp_Array1OfXY.hxx>
#include<TColgp_Array1OfXYZ.hxx>
#include<TColgp_Array2OfCirc2d.hxx>
#include<TColgp_Array2OfDir.hxx>
#include<TColgp_Array2OfDir2d.hxx>
#include<TColgp_Array2OfLin2d.hxx>
#include<TColgp_Array2OfPnt.hxx>
#include<TColgp_Array2OfPnt2d.hxx>
#include<TColgp_Array2OfVec.hxx>
#include<TColgp_Array2OfVec2d.hxx>
#include<TColgp_Array2OfXY.hxx>
#include<TColgp_Array2OfXYZ.hxx>
#include<TColgp_HArray1OfCirc2d.hxx>
#include<TColgp_HArray1OfDir.hxx>
#include<TColgp_HArray1OfDir2d.hxx>
#include<TColgp_HArray1OfLin2d.hxx>
#include<TColgp_HArray1OfPnt.hxx>
#include<TColgp_HArray1OfPnt2d.hxx>
#include<TColgp_HArray1OfVec.hxx>
#include<TColgp_HArray1OfVec2d.hxx>
#include<TColgp_HArray1OfXY.hxx>
#include<TColgp_HArray1OfXYZ.hxx>
#include<TColgp_HArray2OfCirc2d.hxx>
#include<TColgp_HArray2OfDir.hxx>
#include<TColgp_HArray2OfDir2d.hxx>
#include<TColgp_HArray2OfLin2d.hxx>
#include<TColgp_HArray2OfPnt.hxx>
#include<TColgp_HArray2OfPnt2d.hxx>
#include<TColgp_HArray2OfVec.hxx>
#include<TColgp_HArray2OfVec2d.hxx>
#include<TColgp_HArray2OfXY.hxx>
#include<TColgp_HArray2OfXYZ.hxx>
#include<TColgp_HSequenceOfDir.hxx>
#include<TColgp_HSequenceOfDir2d.hxx>
#include<TColgp_HSequenceOfPnt.hxx>
#include<TColgp_HSequenceOfPnt2d.hxx>
#include<TColgp_HSequenceOfVec.hxx>
#include<TColgp_HSequenceOfVec2d.hxx>
#include<TColgp_HSequenceOfXY.hxx>
#include<TColgp_HSequenceOfXYZ.hxx>
#include<TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfAx1.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXY.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXYZ.hxx>
#include<TColgp_SequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceOfAx1.hxx>
#include<TColgp_SequenceOfDir.hxx>
#include<TColgp_SequenceOfDir2d.hxx>
#include<TColgp_SequenceOfPnt.hxx>
#include<TColgp_SequenceOfPnt2d.hxx>
#include<TColgp_SequenceOfVec.hxx>
#include<TColgp_SequenceOfVec2d.hxx>
#include<TColgp_SequenceOfXY.hxx>
#include<TColgp_SequenceOfXYZ.hxx>
#include<TColStd_Array1OfAsciiString.hxx>
#include<TColStd_Array1OfBoolean.hxx>
#include<TColStd_Array1OfByte.hxx>
#include<TColStd_Array1OfCharacter.hxx>
#include<TColStd_Array1OfExtendedString.hxx>
#include<TColStd_Array1OfInteger.hxx>
#include<TColStd_Array1OfListOfInteger.hxx>
#include<TColStd_Array1OfReal.hxx>
#include<TColStd_Array1OfTransient.hxx>
#include<TColStd_Array2OfBoolean.hxx>
#include<TColStd_Array2OfCharacter.hxx>
#include<TColStd_Array2OfInteger.hxx>
#include<TColStd_Array2OfReal.hxx>
#include<TColStd_Array2OfTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapOfIntegerReal.hxx>
#include<TColStd_DataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapOfStringInteger.hxx>
#include<TColStd_DataMapOfTransientTransient.hxx>
#include<TColStd_HArray1OfAsciiString.hxx>
#include<TColStd_HArray1OfBoolean.hxx>
#include<TColStd_HArray1OfByte.hxx>
#include<TColStd_HArray1OfCharacter.hxx>
#include<TColStd_HArray1OfExtendedString.hxx>
#include<TColStd_HArray1OfInteger.hxx>
#include<TColStd_HArray1OfListOfInteger.hxx>
#include<TColStd_HArray1OfReal.hxx>
#include<TColStd_HArray1OfTransient.hxx>
#include<TColStd_HArray2OfBoolean.hxx>
#include<TColStd_HArray2OfCharacter.hxx>
#include<TColStd_HArray2OfInteger.hxx>
#include<TColStd_HArray2OfReal.hxx>
#include<TColStd_HArray2OfTransient.hxx>
#include<TColStd_HPackedMapOfInteger.hxx>
#include<TColStd_HSequenceOfAsciiString.hxx>
#include<TColStd_HSequenceOfExtendedString.hxx>
#include<TColStd_HSequenceOfHAsciiString.hxx>
#include<TColStd_HSequenceOfHExtendedString.hxx>
#include<TColStd_HSequenceOfInteger.hxx>
#include<TColStd_HSequenceOfReal.hxx>
#include<TColStd_HSequenceOfTransient.hxx>
#include<TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfReal.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfTransient.hxx>
#include<TColStd_IndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapOfReal.hxx>
#include<TColStd_IndexedMapOfTransient.hxx>
#include<TColStd_ListIteratorOfListOfAsciiString.hxx>
#include<TColStd_ListIteratorOfListOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfReal.hxx>
#include<TColStd_ListIteratorOfListOfTransient.hxx>
#include<TColStd_ListNodeOfListOfAsciiString.hxx>
#include<TColStd_ListNodeOfListOfInteger.hxx>
#include<TColStd_ListNodeOfListOfReal.hxx>
#include<TColStd_ListNodeOfListOfTransient.hxx>
#include<TColStd_ListOfAsciiString.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<TColStd_ListOfReal.hxx>
#include<TColStd_ListOfTransient.hxx>
#include<TColStd_MapIntegerHasher.hxx>
#include<TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfInteger.hxx>
#include<TColStd_MapIteratorOfMapOfReal.hxx>
#include<TColStd_MapIteratorOfMapOfTransient.hxx>
#include<TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include<TColStd_MapOfAsciiString.hxx>
#include<TColStd_MapOfInteger.hxx>
#include<TColStd_MapOfReal.hxx>
#include<TColStd_MapOfTransient.hxx>
#include<TColStd_MapRealHasher.hxx>
#include<TColStd_MapTransientHasher.hxx>
#include<TColStd_PackedMapOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAddress.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfBoolean.hxx>
#include<TColStd_SequenceNodeOfSequenceOfExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfReal.hxx>
#include<TColStd_SequenceNodeOfSequenceOfTransient.hxx>
#include<TColStd_SequenceOfAddress.hxx>
#include<TColStd_SequenceOfAsciiString.hxx>
#include<TColStd_SequenceOfBoolean.hxx>
#include<TColStd_SequenceOfExtendedString.hxx>
#include<TColStd_SequenceOfHAsciiString.hxx>
#include<TColStd_SequenceOfHExtendedString.hxx>
#include<TColStd_SequenceOfInteger.hxx>
#include<TColStd_SequenceOfReal.hxx>
#include<TColStd_SequenceOfTransient.hxx>
#include<TColStd_StdMapNodeOfMapOfAsciiString.hxx>
#include<TColStd_StdMapNodeOfMapOfInteger.hxx>
#include<TColStd_StdMapNodeOfMapOfReal.hxx>
#include<TColStd_StdMapNodeOfMapOfTransient.hxx>
#include<TCollection.hxx>
#include<TCollection_AsciiString.hxx>
#include<TCollection_BaseSequence.hxx>
#include<TCollection_BasicMap.hxx>
#include<TCollection_BasicMapIterator.hxx>
#include<TCollection_CompareOfInteger.hxx>
#include<TCollection_CompareOfReal.hxx>
#include<TCollection_ExtendedString.hxx>
#include<TCollection_HAsciiString.hxx>
#include<TCollection_HExtendedString.hxx>
#include<TCollection_MapNode.hxx>
#include<TCollection_MapNodePtr.hxx>
#include<TCollection_PrivCompareOfInteger.hxx>
#include<TCollection_PrivCompareOfReal.hxx>
#include<TCollection_SeqNode.hxx>
#include<TCollection_SeqNodePtr.hxx>
#include<TCollection_Side.hxx>
#include<Storage.hxx>
#include<Storage_ArrayOfCallBack.hxx>
#include<Storage_ArrayOfSchema.hxx>
#include<Storage_BaseDriver.hxx>
#include<Storage_BucketOfPersistent.hxx>
#include<Storage_CallBack.hxx>
#include<Storage_Container.hxx>
#include<Storage_Data.hxx>
#include<Storage_DataMapIteratorOfMapOfCallBack.hxx>
#include<Storage_DataMapIteratorOfMapOfPers.hxx>
#include<Storage_DataMapNodeOfMapOfCallBack.hxx>
#include<Storage_DataMapNodeOfMapOfPers.hxx>
#include<Storage_DefaultCallBack.hxx>
#include<Storage_Error.hxx>
#include<Storage_HArrayOfCallBack.hxx>
#include<Storage_HArrayOfSchema.hxx>
#include<Storage_HeaderData.hxx>
#include<Storage_HPArray.hxx>
#include<Storage_HSeqOfRoot.hxx>
#include<Storage_IndexedDataMapNodeOfPType.hxx>
#include<Storage_InternalData.hxx>
#include<Storage_Macros.hxx>
#include<Storage_MapOfCallBack.hxx>
#include<Storage_MapOfPers.hxx>
#include<Storage_OpenMode.hxx>
#include<Storage_PArray.hxx>
#include<Storage_Position.hxx>
#include<Storage_PType.hxx>
#include<Storage_Root.hxx>
#include<Storage_RootData.hxx>
#include<Storage_Schema.hxx>
#include<Storage_SeqOfRoot.hxx>
#include<Storage_SequenceNodeOfSeqOfRoot.hxx>
#include<Storage_SolveMode.hxx>
#include<Storage_stCONSTclCOM.hxx>
#include<Storage_StreamExtCharParityError.hxx>
#include<Storage_StreamFormatError.hxx>
#include<Storage_StreamModeError.hxx>
#include<Storage_StreamReadError.hxx>
#include<Storage_StreamTypeMismatchError.hxx>
#include<Storage_StreamWriteError.hxx>
#include<Storage_TypeData.hxx>
#include<Storage_TypedCallBack.hxx>
%};
%import NCollection.i
%import Standard.i
%import Bnd.i
%import TColStd.i
%import gp.i
%import V3d.i
%import Aspect.i
%import Quantity.i
%import Poly.i
%import TopoDS.i
