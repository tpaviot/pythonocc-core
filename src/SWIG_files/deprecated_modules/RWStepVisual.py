import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepVisual is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepVisual", DeprecationWarning)

from OCC.Core.RWStepVisual import *
