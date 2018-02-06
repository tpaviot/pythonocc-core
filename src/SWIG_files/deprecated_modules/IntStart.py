import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntStart is deprecated since pythonocc-0.18.2. Use OCC.Core.IntStart", DeprecationWarning)

from OCC.Core.IntStart import *
