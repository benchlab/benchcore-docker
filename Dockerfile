FROM alpine:3.7
MAINTAINER BenchX <labs@benchx.io>

RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl jq file

VOLUME [ /benchcore ]
WORKDIR /benchcore
EXPOSE 6614 6620
ENTRYPOINT ["/usr/bin/wrapper.sh"]
CMD ["node", "--proxy_app", "benchsat"]
STOPSIGNAL SIGTERM

COPY wrapper.sh /usr/bin/benchchain-testnet.sh
