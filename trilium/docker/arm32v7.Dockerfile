FROM arm32v7/node:10.20.1-alpine3.10 as build-env
RUN apk add git && \
    apk add python && \
    apk add make && \
    apk add libpng && \
    apk add libpng-dev && \
    apk add pkgconf && \
    apk add autoconf && \
    apk add libtool && \
    apk add nasm && \
    apk add libx11-dev && \
    apk add libxkbfile-dev && \
    apk add gcc && \
    apk add libc-dev
RUN git clone -b stable https://github.com/zadam/trilium.git && \
    cd trilium && \
    git checkout v0.42.3 && \
    npm install
FROM arm32v7/node:10.20.1-alpine3.10
RUN mkdir /trildata
COPY --from=build-env /trilium/ /trilium/
RUN rm -rf /trilium/node_modules
COPY entrypoint.sh /bin/entrypoint.sh
EXPOSE 8080/tcp
ENTRYPOINT [ "/bin/entrypoint.sh" ]