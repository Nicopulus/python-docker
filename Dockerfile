# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/engine/reference/builder/

FROM python:3.11-slim-buster

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install -r requirements.txt
    
COPY app.py .
COPY templates ./templates

# #IT_WORKS -> for development
# CMD ["flask", "--app", "app.py", "run", "--host=0.0.0.0","--debug"]
#IT_WORKS -> for production
# CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000","app:app", "--log-level", "debug"]
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000","app:app", "--log-level", "debug", "--access-logfile", "access.log", "--error-logfile", "error.log"]

# TO BUILD THE IMAGE
# docker --debug  build -t random-data-flask .
# TO START THE CONTAINER
# docker run -d --name flask-app -p 5000:5000 random-data-flask
# TO STOP THE CONTAINER
# docker stop flask-app
# TO DELETE THE CONTAINER
# docker rm flask-app
# TO DELETE THE IMAGE
# docker rmi random-data-flask