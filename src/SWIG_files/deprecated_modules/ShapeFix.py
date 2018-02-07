import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeFix is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeFix", DeprecationWarning)

from OCC.Core.ShapeFix import *
