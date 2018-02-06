import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.gce is deprecated since pythonocc-0.18.2. Use OCC.Core.gce", DeprecationWarning)

from OCC.Core.gce import *
