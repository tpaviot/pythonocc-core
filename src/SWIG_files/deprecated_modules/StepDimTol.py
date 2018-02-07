import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepDimTol is deprecated since pythonocc-0.18.2. Use OCC.Core.StepDimTol", DeprecationWarning)

from OCC.Core.StepDimTol import *
