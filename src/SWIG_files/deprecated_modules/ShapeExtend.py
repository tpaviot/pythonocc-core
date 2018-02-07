import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeExtend is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeExtend", DeprecationWarning)

from OCC.Core.ShapeExtend import *
