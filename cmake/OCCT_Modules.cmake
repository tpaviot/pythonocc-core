LIST(APPEND OCCT_TOOLKIT_MODEL

# TKernel
	FSD
	Message
	NCollection
	OSD
	Plugin
	Quantity
	Resource
	Standard
	StdFail
	Storage
	TColStd
	TCollection
	TShort
	Units
	UnitsAPI
	UnitsMethods
# TKMath
	BSplCLib
	BSplSLib
	BVH
	Bnd
	CSLib
	Convert
	ElCLib
	ElSLib
	Expr
	ExprIntrp
	GeomAbs
	PLib
	Poly
	Precision
	TColgp
	TopLoc
	gp
	math
# TKBRep
	BRep
	BRepAdaptor
	BRepGraph
	BRepLProp
	BRepTools
	BinTools
	TopExp
	TopTools
	TopoDS
# TKG2d
	Adaptor2d
	Geom2d
	Geom2dAdaptor
	Geom2dEval
	LProp
	TColGeom2d
# TKG3d
	Adaptor3d
	AdvApprox
	GProp
	Geom
	GeomAdaptor
	GeomEval
	GeomLProp
	TColGeom
	TopAbs
# TKGeomBase
	AdvApp2Var
	AppCont
	AppDef
	AppParCurves
	Approx
	BndLib
	CPnts
	GeomBndLib
	Extrema
	FEmTool
	GC
	GCE2d
	GCPnts
	Geom2dConvert
	GeomConvert
	GeomLib
	GeomProjLib
	GeomTools
	Hermit
	IntAna
	IntAna2d
	ProjLib
	gce
# TKBO
	BOPAlgo
	BOPDS
	BOPTools
	BRepAlgoAPI
	IntTools
# TKBool
	BRepAlgo
	BRepFill
	BRepProj
	TopOpeBRep
	TopOpeBRepBuild
	TopOpeBRepDS
	TopOpeBRepTool
# TKFeat
	BRepFeat
	LocOpe
# TKFillet
	BRepBlend
	BRepFilletAPI
	Blend
	BlendFunc
	ChFi2d
	ChFi3d
	ChFiDS
	ChFiKPart
	FilletSurf
# TKGeomAlgo
	AppBlend
	ApproxInt
	FairCurve
	GccAna
	GccEnt
	GccInt
	Geom2dAPI
	Geom2dGcc
	Geom2dHatch
	Geom2dInt
	GeomAPI
	GeomFill
	GeomInt
	GeomPlate
	Hatch
	HatchGen
	IntCurve
	IntCurveSurface
	IntImp
	IntImpParGen
	IntPatch
	IntPolyh
	IntRes2d
	IntStart
	IntSurf
	IntWalk
	Intf
	Law
	LocalAnalysis
	NLPlate
	Plate
	TopTrans
# TKHLR
	Contap
	HLRAlgo
	HLRAppli
	HLRBRep
	HLRTopoBRep
	Intrv
	TopBas
	TopCnx
# TKMesh
	BRepMesh
	BRepMeshData
	IMeshData
	IMeshTools
# TKOffset
	BRepOffset
	BRepOffsetAPI
	BiTgte
	Draft
# TKPrim
	BRepPrim
	BRepPrimAPI
	BRepSweep
	Sweep
# TKShHealing
	ShapeAlgo
	ShapeAnalysis
	ShapeBuild
	ShapeConstruct
	ShapeCustom
	ShapeExtend
	ShapeFix
	ShapeProcess
	ShapeProcessAPI
	ShapeUpgrade
# TKTopAlgo
	BRepApprox
	BRepBndLib
	BRepBuilderAPI
	BRepCheck
	BRepClass
	BRepClass3d
	BRepExtrema
	BRepGProp
	BRepIntCurveSurface
	BRepLib
	BRepMAT2d
	BRepTopAdaptor
	Bisector
	IntCurvesFace
	MAT
	MAT2d
# TKXMesh
	XBRepMesh
)

LIST(APPEND OCCT_TOOLKIT_VISUALIZATION

# TKService
	Aspect
	Image
	Media
	Graphic3d
# TKV3d
	AIS
	DsgPrs
	Prs3d
	PrsMgr
	Select3D
	SelectBasics
	SelectMgr
	StdPrs
	StdSelect
	V3d
	PrsDim
# TKMeshVS
	MeshVS
)

LIST(APPEND OCCT_TOOLKIT_DATAEXCHANGE

# TKBinXCAF
	BinMXCAFDoc
	BinXCAFDrivers
# TKIGES
	IGESControl
	IGESData
	IGESToBRep
# TKRWMesh
	RWGltf
	RWObj
	RWMesh
	RWPly
# TKSTEP
	GeomToStep
	STEPConstruct
	STEPControl
	STEPEdit
	STEPSelections
	StepAP203
	StepAP209
	StepAP214
	StepAP242
	StepToGeom
	StepToTopoDS
	TopoDSToStep
# TKSTEP209
	StepElement
	StepFEA
# TKSTEPAttr
	StepDimTol
	StepVisual
	StepKinematics
# TKSTEPBase
	StepBasic
	StepGeom
	StepRepr
	StepShape
# TKSTL
	RWStl
	StlAPI
# TKVRML
	Vrml
	VrmlAPI
	VrmlConverter
	VrmlData
# TKXCAF
	XCAFApp
	XCAFDimTolObjects
	XCAFDoc
	XCAFNoteObjects
	XCAFPrs
	XCAFView
# TKXDEIGES
	IGESCAFControl
# TKXDESTEP
	STEPCAFControl
# TKXSBase
	Interface
	IFSelect
	XSControl
	Transfer
	TransferBRep
	MoniTool
	StepData
	HeaderSection
	RWHeaderSection
	APIHeaderSection
# TKXmlXCAF
	XmlMXCAFDoc
	XmlXCAFDrivers
# TKXDE
	DE
)

LIST(APPEND OCCT_TOOLKIT_OCAF

# TKBin
	BinDrivers
	BinMDataXtd
	BinMNaming
# TKBinL
	BinLDrivers
	BinMDF
	BinMDataStd
	BinMDocStd
	BinMFunction
	BinObjMgt
# TKBinTObj
	BinTObjDrivers
# TKCAF
	TDataXtd
	TNaming
	AppStd
# TKCDF
	CDF
	CDM
	LDOM
	PCDM
	UTL
# TKLCAF
	TDF
	TDataStd
	TFunction
	TDocStd
	AppStdL
# TKTObj
	TObj
# TKVAF
	TPrsStd
# TKXml
	XmlDrivers
	XmlMDataXtd
	XmlMNaming
# TKXmlL
	XmlLDrivers
	XmlMDF
	XmlMDataStd
	XmlMDocStd
	XmlMFunction
	XmlObjMgt
# TKXmlTObj
	XmlTObjDrivers
)

