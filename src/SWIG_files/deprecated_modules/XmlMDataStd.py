import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlMDataStd is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlMDataStd", DeprecationWarning)

from OCC.Core.XmlMDataStd import *
