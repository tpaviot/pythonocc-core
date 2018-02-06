import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeProcessAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeProcessAPI", DeprecationWarning)

from OCC.Core.ShapeProcessAPI import *
