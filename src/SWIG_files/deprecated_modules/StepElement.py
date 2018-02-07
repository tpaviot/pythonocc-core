import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepElement is deprecated since pythonocc-0.18.2. Use OCC.Core.StepElement", DeprecationWarning)

from OCC.Core.StepElement import *
