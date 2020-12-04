FROM python:3.7-alpine
LABEL MAINTAINER="Gal Yacobi"

# tells python to run in unbuffered mode - recommended for docker containers
ENV PYTHONUNBUFFERED 1

# Copy the requirements on to the docker image requirements.txt
COPY ./requirements.txt /requirements.txt

# Install all of the dependencies
RUN pip install -r /requirements.txt

# Create the directory to store the application source code
RUN mkdir /app
WORKDIR /app

# Copy content from local /app to the container /app
COPY ./app /app

# Create a user to run the application (-D for running applications)
RUN adduser -D user
USER user
