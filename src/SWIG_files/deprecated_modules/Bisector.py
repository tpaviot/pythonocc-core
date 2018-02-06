import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Bisector is deprecated since pythonocc-0.18.2. Use OCC.Core.Bisector", DeprecationWarning)

from OCC.Core.Bisector import *
