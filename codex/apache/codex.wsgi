import os, sys
sys.path.append('/srv/codex/Codex.git/')
sys.path.append('/srv/codex/Codex.git/codex/')
os.environ['DJANGO_SETTINGS_MODULE'] = 'codex.settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
