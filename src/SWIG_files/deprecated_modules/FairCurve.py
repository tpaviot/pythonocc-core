import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.FairCurve is deprecated since pythonocc-0.18.2. Use OCC.Core.FairCurve", DeprecationWarning)

from OCC.Core.FairCurve import *
