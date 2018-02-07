import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeConstruct is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeConstruct", DeprecationWarning)

from OCC.Core.ShapeConstruct import *
