import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TFunction is deprecated since pythonocc-0.18.2. Use OCC.Core.TFunction", DeprecationWarning)

from OCC.Core.TFunction import *
