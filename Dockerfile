# syntax=docker/dockerfile:1
FROM python:3.7-alpine
# working folder for the image
WORKDIR /code
# enveronment variables that will be set by default in the image
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
# copy requirments.txt file from repository in windows into image that is building
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# explicite command for expectation of port 5000
EXPOSE 5000
# copying everything in the folder into the current working folder
COPY . .
CMD ["flask", "run"]