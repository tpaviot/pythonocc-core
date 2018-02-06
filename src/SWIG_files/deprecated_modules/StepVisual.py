import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepVisual is deprecated since pythonocc-0.18.2. Use OCC.Core.StepVisual", DeprecationWarning)

from OCC.Core.StepVisual import *
