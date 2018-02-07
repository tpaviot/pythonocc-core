import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepBasic is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepBasic", DeprecationWarning)

from OCC.Core.RWStepBasic import *
