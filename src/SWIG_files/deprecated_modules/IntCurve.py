import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntCurve is deprecated since pythonocc-0.18.2. Use OCC.Core.IntCurve", DeprecationWarning)

from OCC.Core.IntCurve import *
