#!/bin/bash

set -euxo pipefail

gunicorn --bind :8000 --workers 2 fly_django.wsgi
#python manage.py collectstatic --noinput
python manage.py migrate