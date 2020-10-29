#1. Base image
FROM python:3.8.6-slim-buster

# Mark each docker image and container with a tag so that its traceable
ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH:-dev}

# Add working directory
WORKDIR /project

# try using cache
COPY requirements.txt ./
#3. Install our deps
RUN pip install -r requirements.txt

#2. Copy files
COPY . .

