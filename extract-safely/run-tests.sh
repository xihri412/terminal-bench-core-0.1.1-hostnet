#!/bin/bash
python3 -m venv .venv
source .venv/bin/activate
pip install pytest -i https://pypi.tuna.tsinghua.edu.cn/simple
pytest $TEST_DIR/test_outputs.py -rA