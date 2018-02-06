import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BOPAlgo is deprecated since pythonocc-0.18.2. Use OCC.Core.BOPAlgo", DeprecationWarning)

from OCC.Core.BOPAlgo import *
