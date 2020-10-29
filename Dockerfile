#1. Base image
FROM python:3.8.6-slim-buster

#4. Mark each docker image and container with a tag so that its traceable
ARG GIT_HASH

#9. 
ENV TINI_VERSION="v0.19.0"

#10. Adding tini - enhanced init for better signal handling
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

#12. keep pip, setuptools and wheel current
RUN pip install -U \
  pip \
  setuptools \
  wheel

#5. Add working directory
WORKDIR /project

#7. Create new user instead of using root (default)
RUN useradd -m -r newuser && \
  chown newuser /project

#13. Move this to the highest layer as possible to not invalidate cache
ENV GIT_HASH=${GIT_HASH:-dev}

#6. try using cache
COPY requirements.txt ./
#3. Install our deps
RUN pip install -r requirements.txt

#2. Copy files
COPY . .

#8. 
USER newuser

#11. 
ENTRYPOINT [ "/tini", "--" ]