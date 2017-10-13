FROM oberthur/docker-ubuntu:16.04-20170515

MAINTAINER Sergii SHKOLIN <s.shkolin@oberthur.com>

RUN mkdir -p /dns/config

WORKDIR /dns

RUN echo 'APT::Install-Recommends "0"; \n\
	  APT::Get::Assume-Yes "true"; \n\
	  APT::Install-Suggests "0";' > /etc/apt/apt.conf \
    && apt update \
    && apt install python-pip \
    && pip install --upgrade pip \
    && pip install setuptools \
    && pip install boto3 octodns==0.8.6

ENTRYPOINT ["/usr/local/bin/octodns-sync"]
