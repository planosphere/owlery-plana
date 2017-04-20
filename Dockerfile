FROM hseeberger/scala-sbt

MAINTAINER Robbie - Virtual Fly Brain <rcourt@ed.ac.uk>

RUN apt-get update && \
apt-get install git

RUN mkdir -p /opt/VFB && \
cd /opt/VFB/ && \
git clone https://github.com/VirtualFlyBrain/owlery.git

COPY application.conf /opt/VFB/owlery/src/main/resources/application.conf

COPY startup.sh /opt/VFB/owlery/startup.sh

RUN chmod +x /opt/VFB/owlery/startup.sh

RUN cd /opt/VFB/owlery/ && \
sbt debian:packageBin && \
dpkg -i target/owlery_0.*_all.deb

EXPOSE 8080

ENTRYPOINT ["/opt/VFB/owlery/startup.sh"]
