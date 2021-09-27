# DRF-PSQL-TEMPLATE

## GET THESE JUST BY USING THIS TEMPLATE

- Pre-written Dockerfile
- Pre-setted Docker-Compose
  - PostgreSQL Database (also for test db)
  - Nginx
  - WAS (Django)
- Ready-to-production
  - Required packages are already added to dependencies
    - Poetry
    - Pytest
    - Django
    - DRF
    - Document generator: DRF-Spectacular
    - ETC ...
  - Seperated settings file
  - Seperated user apps into `apps/` directory
  - Seperated `urls.py` into `backend/` directory and `api/` directory

### Examples
- <https://github.com/shoeguard/shoeguard-backend>

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
docker compose up -d db test_db
```

## Run your shell in virtual env

```sh
poetry shell
```

## Run Django WAS

```sh
python3 manage.py runserver 0.0.0.0:8000
```

## Run WAS using Docker Compose

### Define Environment Variables

Create a file named `.env` and fill following fields:

```env
DJANGO_SECRET_KEY=your secret key
DJANGO_SETTINGS_MODULE=your settings module name

# following values are optional
PROD_DB_NAME=your production database name
PROD_DB_USER=your production database user
PROD_DB_PASSWORD=your production database password
PROD_DB_HOST=your production database host
```

### Run

```sh
docker-compose up -d --build db was ws
```

### TroubleShooting

The reason is that we haven't defined our image's version.

In this case, deleting the image that we build can be the answer, like:

```sh
docker image rm drf-psql-template_was
```

Now you can build your application, [like above chapter](###Run).

## Run Tests

```sh
docker-compose up --build test_db
pytest -vvk .
```

---

## Let's write some codes!

### Create app

First of all, let's create our app by executing following commands:

```sh
python3 manage.py startapp "appname"
mv "appname" apps
```

Since we have seperated our own apps into `apps` directory, we have to change our app's name from `appname/apps.py`.

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

## What you can do more

- Setup CI / CD
- Add plugins to repository like codecov
- ETC ...
