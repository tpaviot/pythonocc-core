import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepAP203 is deprecated since pythonocc-0.18.2. Use OCC.Core.StepAP203", DeprecationWarning)

from OCC.Core.StepAP203 import *
