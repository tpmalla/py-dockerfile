#1. Base image
FROM python:3.8.6-slim-buster

# Mark each docker image and container with a tag so that its traceable
ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH:-dev}

#2. Copy files
COPY . /src

#3. Install our deps
RUN pip install -r /src/requirements.txt

