import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlMDocStd is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlMDocStd", DeprecationWarning)

from OCC.Core.XmlMDocStd import *
