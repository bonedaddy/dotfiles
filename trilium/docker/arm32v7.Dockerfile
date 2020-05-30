FROM arm32v7/node:10.20.1-stretch as build-env
RUN apt update -y
RUN apt install libsqlite3-dev
RUN apt install libpng16-16 -y 
RUN apt install libpng-dev -y 
RUN apt install pkg-config -y 
RUN apt install autoconf -y 
RUN apt install libtool -y 
RUN apt install build-essential -y 
RUN apt install nasm  -y 
RUN apt install libx11-dev  -y 
RUN apt install libxkbfile-dev -y 
RUN apt install git -y 
# unable to install electron unless this is used
# https://github.com/electron/electron/issues/20723
RUN echo "arch=armv7l" > ~/.npmrc
RUN git clone -b stable https://github.com/zadam/trilium.git /trilium 
RUN cd /trilium && git checkout v0.42.3
RUN cd /trilium && \
    npm install sqlite3 --build-from-source --sqlite=/usr && \
    npm install
RUN rm -rf /trilium/node_modules/electron*
RUN rm -rf /trilium/node_modules/sqlite3/lib/binding/*
FROM arm32v7/node:10.20.1-alpine3.10
RUN mkdir /trildata && mkdir /trilium
COPY --from=build-env /trilium/ /trilium/
COPY entrypoint.sh /bin/entrypoint.sh
EXPOSE 8080/tcp
ENTRYPOINT [ "/bin/entrypoint.sh" ]