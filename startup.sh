#!/bin/sh

cd /opt/VFB/owlery

sed -i "s|http://www.virtualflybrain.org/owl/vfb.owl|${OWLURL}|g" /opt/VFB/owlery/src/main/resources/application.conf

sbt "re-start" "run"
