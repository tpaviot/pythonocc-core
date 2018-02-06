import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepRepr is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepRepr", DeprecationWarning)

from OCC.Core.RWStepRepr import *
