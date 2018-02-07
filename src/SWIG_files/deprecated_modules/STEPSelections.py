import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.STEPSelections is deprecated since pythonocc-0.18.2. Use OCC.Core.STEPSelections", DeprecationWarning)

from OCC.Core.STEPSelections import *
