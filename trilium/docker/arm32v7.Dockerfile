FROM arm32v7/node:10.20.1-alpine3.10 as build-env
RUN apk add git && \
RUN git clone -b stable https://github.com/zadam/trilium.git && \
    cd trilium && \
    git checkout v0.42.3 && \
    npm install
FROM arm32v7node:10.20.1-alpine3.10
RUN mkdir /trildata
COPY --from=build-env /trilium/ /trilium/
COPY entrypoint.sh /bin/entrypoint.sh
EXPOSE 8080/tcp
ENTRYPOINT [ "/bin/entrypoint.sh" ]