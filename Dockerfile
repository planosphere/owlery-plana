FROM dengyiping/scala-sbt-ubuntu

MAINTAINER Robbie - Virtual Fly Brain <rcourt@ed.ac.uk>

RUN apt-get update && \
apt-get install git fakeroot

RUN mkdir -p /opt/VFB && \
cd /opt/VFB/ && \
git clone https://github.com/VirtualFlyBrain/owlery.git

COPY application.conf /opt/VFB/owlery/src/main/resources/application.conf

COPY startup.sh /opt/VFB/owlery/startup.sh

RUN chmod +x /opt/VFB/owlery/startup.sh

RUN cd /opt/VFB/owlery/ && \
sbt debian:packageBin

RUN apt-get update && ls /opt/VFB/owlery/ && ls /opt/VFB/owlery/target/ && dpkg -i /opt/VFB/owlery/target/owlery_0.10_all.deb

RUN rm -rf /opt/VFB

EXPOSE 9024

ENTRYPOINT ["/usr/bin/owlery"]
