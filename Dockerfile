FROM alpine:latest

# install aws
RUN \
  apk --no-cache add groff less python py-pip && \
  pip install awscli && \
  apk --purge -v del py-pip

RUN apk --no-cache add bash curl

# set timezone to local
RUN TZ="America/Los_Angeles" &&\
  apk add --no-cache tzdata &&\
  cp "/usr/share/zoneinfo/$TZ" /etc/localtime &&\
  echo "$TZ" > /etc/timezone &&\
  apk del tzdata

WORKDIR /root
ADD app .
ADD aws.tar.gz .

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]

