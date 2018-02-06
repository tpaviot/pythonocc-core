import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeUpgrade is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeUpgrade", DeprecationWarning)

from OCC.Core.ShapeUpgrade import *
