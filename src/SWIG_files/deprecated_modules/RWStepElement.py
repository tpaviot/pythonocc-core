import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepElement is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepElement", DeprecationWarning)

from OCC.Core.RWStepElement import *
