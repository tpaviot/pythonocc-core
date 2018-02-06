import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepGeom is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepGeom", DeprecationWarning)

from OCC.Core.RWStepGeom import *
