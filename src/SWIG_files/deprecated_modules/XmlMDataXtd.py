import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlMDataXtd is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlMDataXtd", DeprecationWarning)

from OCC.Core.XmlMDataXtd import *
