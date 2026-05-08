FROM python:3.12-slim


ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /demoapp

RUN groupadd -r django-group && useradd -m -r -g django-group djangouser

RUN chown -R djangouser:django-group /demoapp



COPY requirements.txt .

#RUN pip install --no-cache-dir -r requirements.txt

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt


COPY . .

RUN  python manage.py collectstatic --noinput

EXPOSE 8000

#USER djangouser

CMD [ "gunicorn", "demo2.wsgi:application", "--bind", "0.0.0.0:8000"]
