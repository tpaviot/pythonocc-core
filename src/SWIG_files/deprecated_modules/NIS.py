import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.NIS is deprecated since pythonocc-0.18.2. Use OCC.Core.NIS", DeprecationWarning)

from OCC.Core.NIS import *
