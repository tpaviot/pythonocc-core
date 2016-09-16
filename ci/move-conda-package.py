import sys
import os
import glob
import shutil
from conda_build.config import config

binary_package_glob = os.path.join(config.bldpkgs_dir, '{0}*.tar.bz2'.format('pythonocc-core'))
binary_package = glob.glob(binary_package_glob)[0]

shutil.move(binary_package, '.')
