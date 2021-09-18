# DRF-PSQL-TEMPLATE

## Prerequisites

- python3.9
- poetry
- docker
- docker-compose

## Install dependencies

```sh
poetry install
```

## Run PostgreSQL

```sh
docker compose up -d
```

## Run your shell in virtual env

```sh
poetry shell
```

## Run Django WAS

```sh
python3 manage.py runserver 0.0.0.0:8000
```

## Run Tests

```sh
pytest .
```

---

## Let's write some codes!

### Create app

First of all, let's create our app by executing following commands:

```sh
python3 manage.py startapp "appname"
mv "appname" apps
```

Since we have seperated our own apps into `apps` directory, we have to change our app's name from 'appname/apps.py`.

Change like following:

```python3
from django.apps import AppConfig


class AppnameConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.appname'
```

Make sure you have changed `appname` into your real app name.

Or you can simply edit the `name` variable from your `AppnameConfig` class.

Now it's time to register our app into the settings.

Open `backend/settings/base.py` and add your app's name like:

```python3
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # 3rd party
    'rest_framework',
    'drf_spectacular',

    # my apps
    'apps.appname',
]
```

### Write Model

### Write Serializer

### Write your own view

### Write some tests

### Register views
