FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV container=docker

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    wireguard \
    iptables \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/myst && \
    curl -fsSL https://github.com/mysteriumnetwork/node/releases/latest/download/myst_linux_amd64.tar.gz \
    -o /tmp/myst.tar.gz && \
    tar -xzf /tmp/myst.tar.gz -C /tmp/myst && \
    cp /tmp/myst/myst /usr/local/bin/ && \
    cp /tmp/myst/myst_supervisor /usr/local/bin/ 2>/dev/null || true && \
    mkdir -p /etc/mysterium-node && \
    cp -r /tmp/myst/config/* /etc/mysterium-node/ 2>/dev/null || true && \
    rm -rf /tmp/myst.tar.gz /tmp/myst && \
    rm -rf /var/lib/apt/lists/*

COPY docker/mysterium-node/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
