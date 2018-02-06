import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepAP203 is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepAP203", DeprecationWarning)

from OCC.Core.RWStepAP203 import *
