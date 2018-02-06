import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepAlgoAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepAlgoAPI", DeprecationWarning)

from OCC.Core.BRepAlgoAPI import *
