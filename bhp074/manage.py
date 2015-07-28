#!/usr/bin/env python
import os
import sys

SOURCE_DIR = '/home/django/source'#os.path.expanduser('~/source')

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")

    sys.path.insert(1, os.path.join(SOURCE_DIR, 'edc_project/'))
    sys.path.insert(1, os.path.join(SOURCE_DIR, 'lis_project/'))

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
#The END
