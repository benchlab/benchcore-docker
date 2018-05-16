FROM alpine:3.7
MAINTAINER BenchX <labs@benchx.io>

RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl jq file

VOLUME [ /benchcore ]
WORKDIR /benchcore
EXPOSE 6614 6618 6619 6620
ENTRYPOINT ["/usr/bin/benchchain-testnet.sh"]
CMD ["node", "--proxy_app", "benchsat"]
STOPSIGNAL SIGTERM

COPY benchchain-testnet.sh /usr/bin/benchchain-testnet.sh
