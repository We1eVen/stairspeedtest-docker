FROM alpine:3.14 AS builder
ARG TARGETARCH
WORKDIR /build
RUN if [ "$TARGETARCH" = "amd64" ]; then \
    export ARCH=x86_64; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
    export ARCH=aarch64; \
    else \
        echo "Unsupported architecture: $TARGETARCH" && \
        exit 1; \
    fi && \
    apk add bash git && \
    git clone -b master --single-branch --depth=1 https://github.com/We1eVen/stairspeedtest-reborn.git && \
    cd stairspeedtest-reborn && \
    bash scripts/build.alpine.release.sh && \
    rm -rf .git

FROM alpine:3.14
LABEL Auther="tindy2013" \
      Source="https://github.com/tindy2013/stairspeedtest-reborn" \
      Builder="We1eVen"
WORKDIR /speedtest
COPY --from=builder /build/stairspeedtest-reborn/stairspeedtest .
RUN apk add --no-cache bash tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    rm -rf /var/cache/apk/*
ENV PORT=65430
ENV MAXFORKS=1
ENV THREAD=4
VOLUME ["/speedtest/results"]
EXPOSE 65430
ENTRYPOINT ["./webgui.sh"]
