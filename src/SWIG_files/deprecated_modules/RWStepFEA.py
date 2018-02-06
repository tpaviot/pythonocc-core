import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepFEA is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepFEA", DeprecationWarning)

from OCC.Core.RWStepFEA import *
