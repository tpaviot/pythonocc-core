import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StepToTopoDS is deprecated since pythonocc-0.18.2. Use OCC.Core.StepToTopoDS", DeprecationWarning)

from OCC.Core.StepToTopoDS import *
