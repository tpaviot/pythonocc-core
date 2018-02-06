import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AppParCurves is deprecated since pythonocc-0.18.2. Use OCC.Core.AppParCurves", DeprecationWarning)

from OCC.Core.AppParCurves import *
