#!/bin/bash
pip install --timeout 600 --retries 20 pytest -i https://mirrors.aliyun.com/pypi/simple/
pytest $TEST_DIR/test_outputs.py -v -rA