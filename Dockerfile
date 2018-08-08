FROM ubuntu:18.04

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y sudo
RUN apt-get install -y python3-pip python3-dev
RUN apt-get install -y libffi-dev g++ libssl-dev

RUN adduser --disabled-login --gecos "" fmoor
RUN echo "fmoor:secret" | chpasswd
RUN usermod -aG sudo fmoor

USER fmoor
RUN /usr/bin/pip3 install --user ansible

ADD . /home/fmoor/
