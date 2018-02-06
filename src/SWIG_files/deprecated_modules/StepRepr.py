import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepRepr is deprecated since pythonocc-0.18.2. Use OCC.Core.StepRepr", DeprecationWarning)

from OCC.Core.StepRepr import *
