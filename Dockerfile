FROM debian:stable-slim

LABEL Description="A container to contain tor"

RUN apt-get update \
    && apt-get install -y --no-install-recommends  \
    obfs4proxy      \
    socat           \
    tor             \
    tor-geoipdb     \
    torsocks        \
    && \
    rm -rf /src/* /tmp/* /var/lib/apt/lists/*

ENTRYPOINT ["/bin/su", "-l", "-s", "/bin/sh", "debian-tor", "/usr/bin/tor", "-f", "/etc/tor/torrc", "--RunAsDaemon", "0"]
