FROM cloudfoundry/cflinuxfs2

MAINTAINER Jouke Waleson <jouke@waleson.com>

EXPOSE 8080

ENTRYPOINT ["/srv/runner"]

VOLUME /tmp/buildpack-cache

RUN apt-get update && apt-get install python git python-yaml -y --force-yes

RUN mkdir -p /srv/buildpacks/ && cd /srv/buildpacks/ && git clone https://github.com/cloudfoundry/python-buildpack.git && cd python-buildpack && git submodule update --init

RUN mkdir -p /srv/buildpacks/ && cd /srv/buildpacks/ && git clone https://github.com/mendix/cf-mendix-buildpack.git

RUN mkdir -p /home/vcap/

RUN chown -R vcap:vcap /srv /home/vcap/

COPY runner /srv/runner
