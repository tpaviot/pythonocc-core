import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.SortTools is deprecated since pythonocc-0.18.2. Use OCC.Core.SortTools", DeprecationWarning)

from OCC.Core.SortTools import *
