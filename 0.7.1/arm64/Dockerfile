FROM alpine as tools
WORKDIR /compose
RUN apk update && apk add wget && \
    wget https://github.com/tindy2013/stairspeedtest-reborn/releases/download/v0.7.1/stairspeedtest_reborn_arm64.tar.gz && \
    tar xf stairspeedtest_reborn_linux64.tar.gz && \
    wget https://raw.githubusercontent.com/We1eVen/stairspeedtest-docker/master/webgui.sh -O stairspeedtest/webgui.sh && \
    mv stairspeedtest/tools/gui/gui.html stairspeedtest/tools/gui/index.html

FROM alpine
LABEL Auther="tindy2013" \
      Source="https://github.com/tindy2013/stairspeedtest-reborn" \
      Builder="We1eVen"
WORKDIR /speedtest
COPY --from=tools /compose/stairspeedtest .
RUN apk add tzdata bash && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    chmod -R +x *
ENV PORT=65430
ENV MAXFORKS=1
ENV THREAD=4
VOLUME ["/speedtest/results"]
EXPOSE 65430
ENTRYPOINT ["./webgui.sh"]
