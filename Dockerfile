FROM alpine:latest

# install aws
RUN \
  apk -Uuv add groff less python py-pip && \
  pip install awscli && \
  apk --purge -v del py-pip && \
  rm /var/cache/apk/*

RUN apk -Uuv add bash curl

WORKDIR /root
ADD app .

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]

