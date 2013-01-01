import os
import sys
sys.stdout = sys.stderr
# Add the virtual Python environment site-packages directory to the path
import site
site.addsitedir('/srv/codex/Codex.git/env/lib/python2.7/site-packages')


# Avoid ``[Errno 13] Permission denied: '/var/www/.python-eggs'`` messages
import os
os.environ['PYTHON_EGG_CACHE'] = '/srv/codex/Codex.git/codex/apache/egg-cache'

#If your project is not on your PYTHONPATH by default you can add the following
sys.path.append('/srv/codex/Codex.git/env/lib/python2.7/site-packages/django/')
sys.path.append('/srv/codex/Codex.git')
sys.path.append('/srv/codex/Codex.git/codex/')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
