from pathlib import Path

import pytest

TEST_DIR = Path(__file__).resolve().parent


@pytest.fixture(autouse=True)
def run_from_test_dir(monkeypatch):
    """Tests use paths relative to the test directory (./test_io etc.)."""
    monkeypatch.chdir(TEST_DIR)
