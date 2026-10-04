import os

import pytest

TEST_DIR = os.path.dirname(os.path.abspath(__file__))


@pytest.fixture(autouse=True)
def run_from_test_dir(monkeypatch):
    """Tests use paths relative to the test directory (./test_io etc.)."""
    monkeypatch.chdir(TEST_DIR)
