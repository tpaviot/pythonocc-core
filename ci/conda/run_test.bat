cd ..\work\test
pytest -sv
mypy test_mypy_classic_occ_bottle.py
python core_display_tkinter_unittest.py
python core_display_pyqt5_unittest.py
python core_display_pyside2_unittest.py
python core_display_pyside6_unittest.py
python core_display_wx_unittest.py
