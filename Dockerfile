FROM phenoscape/owlery

MAINTAINER Sofia Robb - PLANA Planarian Anatomy Ontology <smr@stowers.org>

ENV OWLURL=http://purl.obolibrary.org/obo/plana.owl

COPY application.conf /srv/conf/application.conf

USER root

COPY startup.sh /startup.sh

RUN chmod +x /startup.sh

USER $APP_USER

ENTRYPOINT ["/startup.sh"]
