FROM ubuntu:18.04
RUN apt-get update && apt-get install -y httpie jq

COPY entrypoint.sh /entrypoint.sh

RUN useradd -m minecraft && \
    mkdir -p /home/minecraft/render /home/minecraft/server
RUN chown minecraft:minecraft -R /home/minecraft/

WORKDIR /home/minecraft/

USER minecraft

ENTRYPOINT ["/entrypoint.sh"]
