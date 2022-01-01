# syntax=docker/dockerfile:1
FROM jupyter/scipy-notebook
# working folder for the image
WORKDIR /home/jovyan/repo
USER root
#install and update files
RUN apt update && apt -y upgrade && apt -y install git
USER jovyan
# copy requirments.txt file from repository in windows into image that is building
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# explicite command for expectation of port 8888
EXPOSE 8888
