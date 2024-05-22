#!/bin/bash
if [ "$(uname)" == "Linux" ]; then
    cd ../work/test
    pytest
    mypy test_mypy_classic_occ_bottle.py
fi
