FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV container=docker

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    sudo \
    wireguard \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ppa.mysterium.network/public-key | gpg --dearmor -o /etc/apt/keyrings/mysterium.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/mysterium.gpg] https://ppa.mysterium.network/mysteriumnetwork/node/ubuntu focal main" > /etc/apt/sources.list.d/mysterium.list && \
    apt-get update && apt-get install -y myst

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]