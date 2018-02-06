import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.RWStepShape is deprecated since pythonocc-0.18.2. Use OCC.Core.RWStepShape", DeprecationWarning)

from OCC.Core.RWStepShape import *
