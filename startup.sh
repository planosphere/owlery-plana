#!/bin/sh

sed -i "s|http://www.virtualflybrain.org/owl/vfb.owl|${OWLURL}|g" /srv/conf/application.conf


/usr/share/owlery/bin/owlery -Dowlery.port=8080 -Dowlery.host=0.0.0.0 -Dconfig.file=/srv/conf/application.conf
