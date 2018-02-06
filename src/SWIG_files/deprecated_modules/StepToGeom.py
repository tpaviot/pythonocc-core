import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepToGeom is deprecated since pythonocc-0.18.2. Use OCC.Core.StepToGeom", DeprecationWarning)

from OCC.Core.StepToGeom import *
