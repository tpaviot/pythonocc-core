import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.LocalAnalysis is deprecated since pythonocc-0.18.2. Use OCC.Core.LocalAnalysis", DeprecationWarning)

from OCC.Core.LocalAnalysis import *
