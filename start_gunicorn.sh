#!/bin/bash

# Activate the virtual environment
source /opt/maas/vboxpower/venv/bin/activate

# Start gunicorn with application-specific settings
exec gunicorn --chdir /opt/maas/vboxpower -b 0.0.0.0:5241 --access-logfile - --error-logfile - -w 2 vboxpower:app
