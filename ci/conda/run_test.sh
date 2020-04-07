#!/bin/bash
cd ../work/test
python run_tests.py
python core_webgl_unittest.py
mypy core_wrapper_features_unittest.py
mypy core_ocaf_unittest.py
