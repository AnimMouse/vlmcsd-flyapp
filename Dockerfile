FROM alpine:latest
ARG VERSION=1113
WORKDIR app
RUN wget https://github.com/kkkgo/vlmcsd/releases/download/${VERSION}/Linux-intel-${VERSION}.zip && \
    unzip Linux-intel-${VERSION}.zip vlmcsd-x64-musl-static && \
    rm Linux-intel-${VERSION}.zip
CMD ["/app/vlmcsd-x64-musl-static","-T0","-De","-c1"]