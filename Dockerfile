FROM alpine

RUN apk add --no-cache git openssh-client bash jq curl&& \
  cat >/etc/ssh/ssh_config <<-EOF
    HOST *
      StrictHostKeyChecking no
      ServerAliveCountMax 3
      ServerAliveInterval 30
    EOF

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]