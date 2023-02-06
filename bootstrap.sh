#!/usr/bin/env bash
python -m venv /tmp/venv --prompt ansible
# shellcheck source=/dev/null
source /tmp/venv/bin/activate
pip install --upgrade pip ansible==7.1.0 --quiet

ansible-playbook main.yaml
