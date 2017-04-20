FROM 1science/sbt

MAINTAINER Robbie - Virtual Fly Brain <rcourt@ed.ac.uk>

ENV SBT_VERSION=0.13.9

RUN apk add git

RUN mkdir -p /opt/VFB && \
cd /opt/VFB/ && \
git clone https://github.com/VirtualFlyBrain/owlery.git

