import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepFEA is deprecated since pythonocc-0.18.2. Use OCC.Core.StepFEA", DeprecationWarning)

from OCC.Core.StepFEA import *
