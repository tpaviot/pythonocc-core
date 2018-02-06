import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepAP214 is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepAP214", DeprecationWarning)

from OCC.Core.RWStepAP214 import *
