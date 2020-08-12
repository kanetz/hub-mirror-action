FROM alpine

RUN apk add --no-cache git openssh-client bash jq curl&& \
  echo "Host *" >> /etc/ssh/ssh_config&& \
  echo "  ServerAliveCountMax 3" >> /etc/ssh/ssh_config&& \
  echo "  ServerAliveInterval 30" >> /etc/ssh/ssh_config&& \
  echo "  StrictHostKeyChecking no" >> /etc/ssh/ssh_config

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]