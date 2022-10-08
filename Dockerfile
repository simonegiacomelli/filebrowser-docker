FROM alpine:3.16.2

RUN apk update && apk add bash mc screen curl
WORKDIR /repo
RUN mkdir -p www-root
RUN mkdir -p bin
RUN curl -s -L https://github.com/filebrowser/filebrowser/releases/download/v2.22.4/linux-amd64-filebrowser.tar.gz | tar -xz -C bin
WORKDIR /repo/db

CMD ../bin/filebrowser config init && \
    ../bin/filebrowser config set -p 3070 && \
    ../bin/filebrowser config set -a 0.0.0.0 && \
    ../bin/filebrowser config set -r /repo/www-root &&\
    ../bin/filebrowser users add admin admin && \
    echo initial setup ok ; \
    ../bin/filebrowser
