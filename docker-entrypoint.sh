#!/bin/bash

set -e

REQUIREMENTS_=${REQUIREMENTS:-"N"}

if [ "${REQUIREMENTS_}" = "Y" ]; then
    pip install --no-cache-dir -r requirements.txt
fi

exec "$@"