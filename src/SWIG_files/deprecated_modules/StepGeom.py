import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepGeom is deprecated since pythonocc-0.18.2. Use OCC.Core.StepGeom", DeprecationWarning)

from OCC.Core.StepGeom import *
