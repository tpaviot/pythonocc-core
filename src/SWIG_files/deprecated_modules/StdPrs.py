import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StdPrs is deprecated since pythonocc-0.18.2. Use OCC.Core.StdPrs", DeprecationWarning)

from OCC.Core.StdPrs import *
