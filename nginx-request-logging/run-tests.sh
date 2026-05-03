#!/bin/bash

# Install test dependencies
pip install pytest requests  -i https://pypi.tuna.tsinghua.edu.cn/simple

# Run the tests
pytest $TEST_DIR/test_outputs.py -v -rA