import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopTrans is deprecated since pythonocc-0.18.2. Use OCC.Core.TopTrans", DeprecationWarning)

from OCC.Core.TopTrans import *
