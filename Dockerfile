FROM ubuntu:20.04

RUN apt-get update && \
	apt-get install -y vim sudo && \
	adduser --disabled-login --gecos "" fmoor && \
	echo "fmoor:secret" | chpasswd && \
	usermod -aG sudo fmoor

USER fmoor
WORKDIR /home/fmoor/
