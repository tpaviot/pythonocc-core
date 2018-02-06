import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeAnalysis is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeAnalysis", DeprecationWarning)

from OCC.Core.ShapeAnalysis import *
