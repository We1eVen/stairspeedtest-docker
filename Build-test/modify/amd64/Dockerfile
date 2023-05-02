FROM alpine as builder
WORKDIR /build
RUN export ARCH=x86_64 && \
    apk add bash git && \
    git clone -b master --single-branch --depth=1 https://github.com/We1eVen/stairspeedtest-reborn.git && \
    cd stairspeedtest-reborn && \
    bash scripts/build.alpine.release.sh

FROM alpine
LABEL Auther="tindy2013" \
      Source="https://github.com/tindy2013/stairspeedtest-reborn" \
      Builder="We1eVen"
WORKDIR /speedtest
COPY --from=builder /build/stairspeedtest-reborn/stairspeedtest .
RUN apk add bash tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    chmod -R +x *
ENV PORT=65430
ENV MAXFORKS=1
ENV THREAD=4
VOLUME ["/speedtest/results"]
EXPOSE 65430
ENTRYPOINT ["./webgui.sh"]
