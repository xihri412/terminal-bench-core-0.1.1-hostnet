#!/bin/bash
pip install pytest -i https://pypi.tuna.tsinghua.edu.cn/simple
pytest $TEST_DIR/test_outputs.py -v -rA