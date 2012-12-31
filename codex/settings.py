import os

ENVIRONMENT = "DEV"

if ENVIRONMENT=="DEV":
    from settingsdev import *
elif ENVIRONMENT == 'pro':
    from settingspro import *
else:
    from settingsdev import *
