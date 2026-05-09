#!/bin/bash

# Install test dependencies
pip install --timeout 600 --retries 20 pytest requests -i https://mirrors.aliyun.com/pypi/simple/

# Run the tests
python -m pytest $TEST_DIR/test_outputs.py -v -rA
