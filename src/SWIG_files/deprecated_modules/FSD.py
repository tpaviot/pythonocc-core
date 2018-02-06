import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.FSD is deprecated since pythonocc-0.18.2. Use OCC.Core.FSD", DeprecationWarning)

from OCC.Core.FSD import *
