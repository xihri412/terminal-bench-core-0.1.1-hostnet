#!/bin/bash

source $TEST_DIR/setup-uv-pytest.sh

python3 -m pytest $TEST_DIR/test_outputs.py -rA
