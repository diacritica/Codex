import os
import sys
sys.stdout = sys.stderr
# Add the virtual Python environment site-packages directory to the path
import site
site.addsitedir('/srv/codex_virtualenv/lib/python2.7/site-packages')


# Avoid ``[Errno 13] Permission denied: '/var/www/.python-eggs'`` messages
import os
os.environ['PYTHON_EGG_CACHE'] = '/srv/codex_virtualenv/codex/apache/egg-cache'

#If your project is not on your PYTHONPATH by default you can add the following
sys.path.append('/srv/codex_virtualenv/django_svn/django-trunk/')
sys.path.append('/srv/codex_virtualenv/')
sys.path.append('/srv/codex_virtualenv/codex/')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settingspro'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
