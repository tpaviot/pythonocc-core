import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepAP214 is deprecated since pythonocc-0.18.2. Use OCC.Core.StepAP214", DeprecationWarning)

from OCC.Core.StepAP214 import *
