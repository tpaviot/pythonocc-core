import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntImpParGen is deprecated since pythonocc-0.18.2. Use OCC.Core.IntImpParGen", DeprecationWarning)

from OCC.Core.IntImpParGen import *
