import shutil
import fnmatch
import os
import sys

# Find all .bz2 binary packages below
# home/travis/miniconda/conda-bld/
binary_packages = []
if sys.platform.startswith("linux"):
	HOME = os.path.join(os.sep, 'home')  # /home
elif sys.platform.startswith("darwin"):
	HOME = os.path.join(os.sep, 'Users')  # /Users
path_to_recurse = os.path.join(HOME, 'travis', 'miniconda', 'conda-bld')
if not os.path.isdir(path_to_recurse):
    print('warning: %s not found' % path_to_recurse)
for root, dirnames, filenames in os.walk(path_to_recurse):
    for filename in fnmatch.filter(filenames, '*.tar.bz2'):
        binary_packages.append(os.path.join(root, filename))

# move all binary packages up to .
for binary_package in binary_packages:
    print("Moving %s up to ." % binary_package)
    shutil.move(binary_package, '.')
