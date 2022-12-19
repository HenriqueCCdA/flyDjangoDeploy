#ARG PYTHON_VERSION=3.11-slim-buster
ARG PYTHON_VERSION=3.11-alpine3.17

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# WORKDIR /app



# RUN apt-get update && apt-get install -y\
#     libpq-dev\
#     gcc\
#     && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    apk update --no-cache\
    && apk add --no-cache \
    libpq-dev\
    gcc\
    libc-dev

# RUN adduser -D myuser
# USER myuser
# WORKDIR /home/myuser/app

COPY requirements.txt .

RUN set -ex && \
    pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

ENTRYPOINT [ "./start.sh" ]
