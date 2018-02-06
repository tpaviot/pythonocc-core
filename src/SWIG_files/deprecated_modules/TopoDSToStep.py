import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopoDSToStep is deprecated since pythonocc-0.18.2. Use OCC.Core.TopoDSToStep", DeprecationWarning)

from OCC.Core.TopoDSToStep import *
