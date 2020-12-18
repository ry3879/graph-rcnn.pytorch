#FROM lambda-stack:latest
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
CMD nvidia-smi
FROM ubuntu:18.04
FROM python:3.6.9
FROM pytorch/pytorch:1.0-cuda10.0-cudnn7-devel
RUN apt-get update && apt-get install
RUN apt install build-essential

# set a directory
WORKDIR ~/

#copy requirements to container
COPY requirements.txt .
RUN pip install -r requirements.txt 
RUN apt-get install -y libglib2.0-0
RUN apt-get install -y libsm6
RUN apt-get install -y vim
RUN pip install scipy

COPY . .

#RUN cd lib/scene_parser/rcnn && python setup.py build develop
#CMD cd lib/scene_parser/rcnn && ["python", "setup.py build develop"]


