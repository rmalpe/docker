FROM python:3.8.0-alpine3.10
WORKDIR  /app

COPY requirements.txt .
RUN apk update && apk add python3-dev \
                          g++ \
                          libc-dev \
                          libffi-dev 

RUN pip install --upgrade pip
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install -r requirements.txt
COPY . .
CMD [ "opsdroid","start"]