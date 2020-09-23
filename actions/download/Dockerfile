FROM ubuntu:18.04
RUN apt-get update && apt-get install -y lftp

COPY entrypoint.sh /entrypoint.sh
    
ENTRYPOINT ["/entrypoint.sh"]
