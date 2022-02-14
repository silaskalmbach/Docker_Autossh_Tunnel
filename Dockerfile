FROM alpine:latest

RUN apk --no-cache add autossh bash

ADD tunnel.sh /tunnel.sh
ADD ssh_key/ /ssh_key/
RUN chmod -R 700 /ssh_key/

CMD ["/bin/sh", "tunnel.sh"]
## For intreractive Testing
# CMD ["/bin/bash"]