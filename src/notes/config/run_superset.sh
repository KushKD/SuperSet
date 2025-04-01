#!/bin/bash
export SUPERSET_CONFIG_PATH=/superset_app/superset_one/superset_config.py
 . /superset_app/superset_one/superset_env/bin/activate
gunicorn \
      -w 10 \
      -k gevent \
      --timeout 120 \
      -b  0.0.0.0:8088 \
      --limit-request-line 0 \
      --limit-request-field_size 0 \
      --statsd-host localhost:8125 \
      "superset.app:create_app()"