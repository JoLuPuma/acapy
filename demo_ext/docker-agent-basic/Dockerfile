FROM ghcr.io/hyperledger/aries-cloudagent-python:py3.9-0.10.3

USER root

# install redis PQ acapy plugin
#RUN pip install git+https://github.com/hyperledger/aries-acapy-plugins@main#subdirectory=redis_events


ADD https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 ./jq
RUN chmod +x ./jq

COPY start.sh start.sh
COPY ./configs configs

RUN chmod +x ./start.sh

USER $user
