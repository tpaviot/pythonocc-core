import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepBasic is deprecated since pythonocc-0.18.2. Use OCC.Core.StepBasic", DeprecationWarning)

from OCC.Core.StepBasic import *
