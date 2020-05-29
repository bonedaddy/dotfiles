FROM node:10.20.1-alpine3.10 as build-env
RUN apk add git
RUN git clone -b stable https://github.com/zadam/trilium.git && \
    cd trilium && \
    git checkout v0.42.3 && \
    npm install
FROM alpine:3.10
RUN mkdir /trilium
COPY --from=build-env /trilium /trilium
ENTRYPOINT [ "cd /trilium" ]