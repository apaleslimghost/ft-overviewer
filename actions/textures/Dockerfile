FROM ubuntu:18.04
RUN apt-get update && apt-get install -y httpie jq

COPY entrypoint.sh /entrypoint.sh
    
ENTRYPOINT ["/entrypoint.sh"]
