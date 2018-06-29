#!/bin/sh

cd /opt/VFB/owlery

sed -i "s|http://www.virtualflybrain.org/owl/vfb.owl|${OWLURL}|g" /opt/VFB/owlery/src/main/resources/application.conf


/usr/share/owlery/bin/owlery -Dowlery.port=8080 -Dowlery.host=0.0.0.0
