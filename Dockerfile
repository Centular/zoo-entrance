FROM ubuntu:18.04

RUN apt-get update && apt-get install --no-install-recommends -y stunnel4 &&  rm -rf /var/lib/apt/lists/*

ENV LOG_LEVEL debug
ENV STUNNEL_HOME "/opt/stunnel"
ENV ACCCEPT 0.0.0.0:2181

WORKDIR "${STUNNEL_HOME}"

COPY ./stunnel-scripts/ $STUNNEL_HOME

CMD "./stunnel_run.sh"