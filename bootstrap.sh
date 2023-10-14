#!/usr/bin/env bash
python -m venv /tmp/venv --prompt ansible
# shellcheck source=/dev/null
source /tmp/venv/bin/activate
pip install --upgrade --quiet --requirement requirements.txt

ansible-playbook main.yaml
