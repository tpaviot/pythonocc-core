import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntCurvesFace is deprecated since pythonocc-0.18.2. Use OCC.Core.IntCurvesFace", DeprecationWarning)

from OCC.Core.IntCurvesFace import *
