import unittest

PYTHONOCC_VERSION_MAJOR = 0
PYTHONOCC_VERSION_MINOR = 18
PYTHONOCC_VERSION_PATCH = 2
#  Empty for official releases, set to -dev, -rc1, etc for development releases
PYTHONOCC_VERSION_DEVEL = '-dev'

VERSION = "%s.%s.%s%s" % (PYTHONOCC_VERSION_MAJOR, PYTHONOCC_VERSION_MINOR,
                          PYTHONOCC_VERSION_PATCH, PYTHONOCC_VERSION_DEVEL)


class pythonoccVersionNumberError(Exception):
    pass


def require_pythonocc_version(required_version):
    """ Check if the required pythonocc version is available.
    required_version : a string containing three values separated by a dot
    (eg '0.1.7.1', '0.19.4-rc1')
    returns True if required match vurrent version, or raise en error
    """
    spl = required_version.split('.')
    if len(spl) == 3:
        major, minor, patch_dev = spl
        if '-' in patch_dev:
            patch, dev = patch_dev.split('-')
        else:
            patch = patch_dev
            dev = ''
    elif len(spl) == 2:
        major, minor = spl
        patch = 0
        dev = ''
    
    if ((int(major) > PYTHONOCC_VERSION_MAJOR) or
       (int(major) == PYTHONOCC_VERSION_MAJOR and int(minor) > PYTHONOCC_VERSION_MINOR) or
       (int(major) == PYTHONOCC_VERSION_MAJOR and int(minor) == PYTHONOCC_VERSION_MINOR and
        int(patch) >= PYTHONOCC_VERSION_PATCH)):
        return True
    else:
        raise pythonoccVersionNumberError("Require pythonocc-%s but current is pythonocc-%s" % (required_version, VERSION))

def test_require_pythonocc_version():
    # this one should raise an assertion error
    try:
        require_pythonocc_version('0.17.1')
    except pythonoccVersionNumberError:
        print("Exception correctly raised for 0.17.1 check")
    try:
        require_pythonocc_version('0.18')
    except pythonoccVersionNumberError:
        print("Exception correctly raised for 0.18 check")
    try:
        require_pythonocc_version('0.18.1')
    except pythonoccVersionNumberError:
        print("Exception correctly raised for 0.18.1 check")
    # the following should be ok
    require_pythonocc_version('0.18.2-dev')
    require_pythonocc_version('0.18.2')
    require_pythonocc_version('0.18.3-rc2')
    require_pythonocc_version('0.19')
    require_pythonocc_version('0.19.1')
    require_pythonocc_version('1.0')


if __name__ == "__main__":
    test_require_pythonocc_version()

