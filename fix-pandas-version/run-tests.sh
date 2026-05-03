#!/bin/bash

pip install pytest  -i https://pypi.tuna.tsinghua.edu.cn/simple

python -m pytest $TEST_DIR/test_outputs.py -rA