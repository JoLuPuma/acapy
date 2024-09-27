FROM ghcr.io/hyperledger/aries-cloudagent-python:py3.12-1.0.0

USER root

# install redis PQ acapy plugin
#RUN pip install git+https://github.com/hyperledger/aries-acapy-plugins@main#subdirectory=redis_events


ADD https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 ./jq
RUN chmod +x ./jq


COPY ./configs configs

USER $user
