import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepAP209 is deprecated since pythonocc-0.18.2. Use OCC.Core.StepAP209", DeprecationWarning)

from OCC.Core.StepAP209 import *
