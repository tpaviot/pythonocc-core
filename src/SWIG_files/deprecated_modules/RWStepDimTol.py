import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepDimTol is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepDimTol", DeprecationWarning)

from OCC.Core.RWStepDimTol import *
