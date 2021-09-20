FROM python:3.9.6

ENV IS_DOCKER true
ENV PYTHONBUFFERED 1

WORKDIR /app

# install dependencies
RUN pip install --upgrade pip
RUN pip install poetry
COPY poetry.lock poetry.lock
COPY pyproject.toml pyproject.toml
RUN poetry install --no-dev

EXPOSE 8000

COPY . /app

CMD bash -c "\
    poetry run python manage.py collectstatic --noinput --settings=$DJANGO_SETTINGS_MODULE;\
    poetry run python manage.py migrate --settings=$DJANGO_SETTINGS_MODULE; \
    poetry run gunicorn backend.wsgi:application --bind 0.0.0.0:8000"