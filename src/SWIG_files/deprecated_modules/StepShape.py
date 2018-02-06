import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepShape is deprecated since pythonocc-0.18.2. Use OCC.Core.StepShape", DeprecationWarning)

from OCC.Core.StepShape import *
