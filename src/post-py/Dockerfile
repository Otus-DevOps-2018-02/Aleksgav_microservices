FROM python:3.6.0-alpine

WORKDIR /app
ADD requirements.txt /app

RUN pip install -r /app/requirements.txt

ADD . /app

ENV POST_DATABASE_HOST=post_db POST_DATABASE=posts

ENTRYPOINT ["python3", "post_app.py"]
