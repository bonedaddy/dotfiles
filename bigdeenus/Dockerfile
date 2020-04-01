FROM alpine:3.11
RUN mkdir /coredns
ADD ./coredns_entrypoint.sh /coredns/entrypoint.sh
ADD ./coredns /bin/coredns
ENTRYPOINT ["/coredns/entrypoint.sh"]

