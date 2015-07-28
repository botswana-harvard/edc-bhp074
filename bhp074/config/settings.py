# Django settings for bhp project.
from unipath import Path
import os
import platform
import sys
import logger

from .installed_apps import DJANGO_APPS, THIRD_PARTY_APPS, EDC_APPS, LIS_APPS, LOCAL_APPS


DEBUG = False
INTERNAL_IPS = ('127.0.0.1',)
TEMPLATE_DEBUG = DEBUG
DIRNAME = os.path.dirname(__file__)

#Email configuration
SEND_BROKEN_LINK_EMAILS = True
SERVER_EMAIL = 'edcdev@bhp.org.bw'
EMAIL_SUBJECT_PREFIX = '[eit] '
DEFAULT_FROM_EMAIL = 'edcdev@bhp.org.bw'
ADMINS = (
    ('fchilisa', 'fchilisa@bhp.org.bw'),
)

# Path
PROJECT_ROOT = Path(__file__).ancestor(3)
SOURCE_DIR = Path(__file__).ancestor(3)
PROJECT_DIR = Path(__file__).ancestor(2)
MEDIA_ROOT = PROJECT_DIR.child('media')
STATIC_ROOT = PROJECT_DIR.child('static')
TEMPLATE_DIRS = (
#     '/Users/fchilisa/source/edc_project/edc/templates',
    '/home/django/source/edc_project/edc/templates',
    )
STATICFILES_DIRS = ()
CONFIG_DIR = PROJECT_DIR.child('bhp074')

#Key Path
# KEY_PATH = '/Users/fchilisa/source/bhp074_project/bhp074/keys'
KEY_PATH = '/home/django/source/bhp074_project/bhp074/keys'

MAP_DIR = STATIC_ROOT.child('img')

MANAGERS = ADMINS
testing_db_name = 'sqlite'
if 'test' in sys.argv:
    # make tests faster
    SOUTH_TESTS_MIGRATE = False
    if testing_db_name == 'sqlite':
        DATABASES = {
            'default': {
                'ENGINE': 'django.db.backends.sqlite3',
                'NAME': 'default',
                'USER': 'root',
                'PASSWORD': 'cc3721b',
                'HOST': '',
                'PORT': ''},
        }
    else:
        DATABASES = {
            'default': {
                'ENGINE': 'django.db.backends.mysql',
                'OPTIONS': {
                    'init_command': 'SET storage_engine=INNODB',
                },
                'NAME': 'test_default',
                'USER': 'root',
                'PASSWORD': 'cc3721b',
                'HOST': '',
                'PORT': '',
            },
        }
else:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'OPTIONS': {
                'init_command': 'SET storage_engine=INNODB',
            },
            'NAME': 'bhp074',
            'USER': 'root',
            'PASSWORD': 'cc3721b',
            'HOST': '',
            'PORT': '',
        },
        'lab_api': {
            'ENGINE': 'django.db.backends.mysql',
            'OPTIONS': {
                'init_command': 'SET storage_engine=INNODB',
            },
            'NAME': 'lab',
            'USER': 'root',
            'PASSWORD': 'cc3721b',
            'HOST': 'bhhrl.bhp.org.bw',
            'PORT': '3306',
        },
    }

# Hosts/domain names that are valid for this site; required if DEBUG is False
# See https://docs.djangoproject.com/en/1.5/ref/settings/#allowed-hosts
ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'eit', 'eit.bhp.org.bw', '192.168.1.18']

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'Africa/Gaborone'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html

LANGUAGE_CODE = 'en'
LANGUAGES = (
             ('en', 'English'),
             ('tn', 'Setswana'),
)

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
#MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'media')

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
MEDIA_URL = '/media/'

# Absolute path to the directory that holds static files.
# Example: "/home/media/media.lawrence.com/static/"
#STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')

# URL that handles the static files served from STATIC_ROOT.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/static/'


# URL prefix for admin media -- CSS, JavaScript and images.
# Make sure to use a trailing slash.
# Examples: "http://foo.com/static/admin/", "/static/admin/".
#ADMIN_MEDIA_PREFIX = '/static/admin/'

# A list of locations of additional static files
STATICFILES_DIRS = ()

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'dajaxice.finders.DajaxiceFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'h3GsoA-56d3a3mTCyjk32EMArddu2m2yhDbGfssT9xc'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    ('django.template.loaders.cached.Loader', (
     'django.template.loaders.filesystem.Loader',
     'django.template.loaders.app_directories.Loader',
     'django.template.loaders.eggs.Loader',
     )),
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
#     'debug_toolbar.middleware.DebugToolbarMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS = ("django.contrib.auth.context_processors.auth",
                               "django.core.context_processors.debug",
                               "django.core.context_processors.i18n",
                               "django.core.context_processors.media",
                               "django.core.context_processors.static",
                               "django.core.context_processors.request",
                               "django.contrib.messages.context_processors.messages")

ROOT_URLCONF = 'config.urls'

# Python dotted path to the WSGI application used by Django's runserver.
WSGI_APPLICATION = 'config.wsgi.application'

INSTALLED_APPS = DJANGO_APPS + THIRD_PARTY_APPS + EDC_APPS + LIS_APPS + LOCAL_APPS

# django email settings
EMAIL_HOST = 'mail.bhp.org.bw'
EMAIL_PORT = '25'
EMAIL_HOST_USER = 'edcdev'
EMAIL_HOST_PASSWORD = 'cc3721b'
EMAIL_USE_TLS = True
#EMAIL_AFTER_CONSUME = False

SOUTH_LOGGING_FILE = os.path.join(os.path.dirname(__file__), "south.log")
SOUTH_LOGGING_ON = True
AUTH_PROFILE_MODULE = "bhp_userprofile.userprofile"
DAJAXICE_MEDIA_PREFIX = "dajaxice"

# only for community server
IS_COMMUNITY_SERVER = True
ALLOW_DELETE_MODEL_FROM_SERIALIZATION = False
ALLOW_MODEL_SERIALIZATION = False

# EDC GENERAL SETTINGS
APP_NAME = 'eit'
PROJECT_NUMBER = 'BHP074'
PROJECT_IDENTIFIER_PREFIX = '074'
PROJECT_IDENTIFIER_MODULUS = 7
PROJECT_TITLE = 'EIT Study'
PROTOCOL_REVISION = ''
INSTITUTION = 'Botswana-Harvard AIDS Institute Partnership'
LOGIN_URL = '/{app_name}/login/'.format(app_name=APP_NAME)
LOGIN_REDIRECT_URL = '/{app_name}/'.format(app_name=APP_NAME)
LOGOUT_URL = '/{app_name}/logout/'.format(app_name=APP_NAME)
SHORT_DATE_FORMAT = 'Y-m-d'
SHORT_DATETIME_FORMAT = 'Y-m-d H:i'
LAB_SECTION = 'eit_lab'
LAB_LOCK_NAME = 'BHP074'
LABDB = 'bhplab'
SESSION_COOKIE_AGE = 3000
SESSION_EXPIRE_AT_BROWSER_CLOSE = True
DEVICE_ID = '99'
SERVER_DEVICE_ID_LIST = [99,]
MIDDLEMAN_DEVICE_ID_LIST = []
SUBJECT_TYPES = ['infant', 'maternal']
MAX_SUBJECTS = {'maternal': 100, 'infant': 100}
APPOINTMENTS_PER_DAY_MAX = 20
APPOINTMENTS_DAYS_FORWARD = 15
LABEL_PRINTER_MAKE_AND_MODEL = ['Zebra ZPL Label Printer']

SUBJECT_APP_LIST = ['eit_infant', 'eit_maternal']
DISPATCH_APP_LABELS = []

#BHP_CRYPTO_SETTINGS
IS_SECURE_DEVICE = False
MAY_CREATE_NEW_KEYS = True

FIELD_MAX_LENGTH = 'migration'

# LAB REFERENCE AND GRADING
REFERENCE_RANGE_LIST = 'BHPLAB_NORMAL_RANGES_201005'
GRADING_LIST = 'DAIDS_2004'

# for bhp_import_dmis
dsn = 's012'
user = 'sa'
password = 'cc3721b'
database = 'BHPLAB'
driver = '{FreeTDS}'
mac_driver = '/usr/local/lib/libtdsodbc.so'
if platform.system() == 'Darwin':
    LAB_IMPORT_DMIS_DATA_SOURCE = 'DSN=%s;UID=%s;PWD=%s;DATABASE=%s;DRIVER=%s' % (dsn, user, password, database, mac_driver)
                                  #('DRIVER=/usr/local/lib/libtdsodbc.so;SERVER=192.168.1.141;'
                                  #'PORT=1433;UID=sa;PWD=cc3721b;DATABASE=BHPLAB;'
                                  #'CHARSET=UTF8;TDS_Version=8.0; ServerName=s012')
else:
    LAB_IMPORT_DMIS_DATA_SOURCE = 'DSN=%s;UID=%s;PWD=%s;DATABASE=%s;DRIVER=%s' % (dsn, user, password, database, driver)
                                  #('DRIVER={FreeTDS};SERVER=192.168.1.141;UID=sa;PWD=cc3721b;'
                                  #'DATABASE=BHPLAB;CHARSET=UTF8;TDS_Version=8.0;PORT=1433; ServerName=s012')
VAR_ROOT = '/var'
#LOGGING = logger.LOGGING
