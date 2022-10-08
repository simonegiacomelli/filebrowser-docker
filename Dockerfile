FROM alpine:3.16.2

RUN apk update && apk add bash mc screen curl
WORKDIR /repo
RUN mkdir -p www-root
RUN mkdir -p bin
RUN curl -s -L https://github.com/filebrowser/filebrowser/releases/download/v2.22.4/linux-amd64-filebrowser.tar.gz | tar -xz -C bin
WORKDIR /repo/db

CMD timeout 1s ../bin/filebrowser -p 3070 -a 0.0.0.0  -r /repo/www-root ; \
    echo setup ok && \
    ../bin/filebrowser
