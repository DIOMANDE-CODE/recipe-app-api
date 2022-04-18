FROM python:3.9-alpine
MAINTAINER pythous
EXPOSE 8080

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user

ENTRYPOINT ["python","manage.py", "runserver","127.0.0.0:8000"]