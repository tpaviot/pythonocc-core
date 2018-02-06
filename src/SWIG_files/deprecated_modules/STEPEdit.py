import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.STEPEdit is deprecated since pythonocc-0.18.2. Use OCC.Core.STEPEdit", DeprecationWarning)

from OCC.Core.STEPEdit import *
