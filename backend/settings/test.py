from .base import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'database',
        'USER': 'postgres',
        'HOST': 'localhost',
        'PORT': '5433',
    }
}
