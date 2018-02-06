import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeAlgo is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeAlgo", DeprecationWarning)

from OCC.Core.ShapeAlgo import *
