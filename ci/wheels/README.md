# PyPI wheels

The pythonocc-core wheels published on PyPI are built by
[cibuildwheel](https://cibuildwheel.pypa.io) in the GitHub Actions workflow
`.github/workflows/wheels.yml`:

| Platform | Wheels                                     | Runner                       |
|----------|--------------------------------------------|------------------------------|
| Linux    | `manylinux_2_28_x86_64`, `manylinux_2_28_aarch64` | `ubuntu-24.04`, `ubuntu-24.04-arm` |
| macOS    | `macosx_11_0_x86_64`, `macosx_11_0_arm64`  | `macos-15-intel`, `macos-15` |
| Windows  | `win_amd64`                                | `windows-2022`               |

for CPython 3.10 to 3.14, plus the sdist.

* `pyproject.toml`: the scikit-build-core build, the version is read from
  `CMakeLists.txt`, and the cibuildwheel configuration.
* `deps/`: the native dependencies build scripts: SWIG, OCCT and its 3rd
  parties (freetype, FreeImage, RapidJSON).
  * Linux: built in the manylinux_2_28 container, 3rd parties from the
    system (EPEL for FreeImage).
  * macOS, Windows: built on the runner, 3rd parties built by vcpkg through
    the OCCT vcpkg manifest, with the triplets of `triplets/`.

For each platform, a first job builds the dependencies and saves them to the
GitHub cache (the key is a hash of the platform scripts and triplet), then one
job per Python version restores them and builds and tests a wheel. The
libraries are vendored in the wheels by auditwheel (Linux), delocate (macOS)
and delvewheel (Windows).

The workflow runs on the pushes to master and review/* that change the
packaging, on demand (workflow_dispatch), and on the tags.

## Releasing

Pushing a tag builds the wheels and the sdist and uploads them to PyPI
through [trusted publishing](https://docs.pypi.org/trusted-publishers/).
This requires, once:

* on PyPI, a trusted publisher for the `pythonocc-core` project: owner
  `tpaviot`, repository `pythonocc-core`, workflow `wheels.yml`, environment
  `pypi`.
* on GitHub, a `pypi` environment in the repository settings (optionally
  with required reviewers, to approve each upload).

When upgrading SWIG or OCCT, update the versions in the three `deps/`
scripts, the cache is invalidated by their change.

## Building locally

Linux wheels can be built on any machine with docker:

```bash
pip install cibuildwheel
# optional: cache SWIG and OCCT between runs (/host is the host filesystem)
export PYOCC_DEPS_CACHE=/host$HOME/.cache/pyocc-deps
CIBW_BUILD='cp312-*' cibuildwheel --platform linux
```

from a clean checkout: cibuildwheel copies the whole source tree into the
container.
