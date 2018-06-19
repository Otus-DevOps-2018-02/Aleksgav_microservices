FROM golang:latest as builder

ENV SRC $GOPATH/src/github.com/prometheus/blackbox_exporter

WORKDIR $SRC

RUN git clone https://github.com/prometheus/blackbox_exporter.git $SRC && make build


FROM alpine:latest

COPY --from=builder /go/src/github.com/prometheus/blackbox_exporter/blackbox_exporter /bin/blackbox_exporter
COPY --from=builder /go/src/github.com/prometheus/blackbox_exporter/blackbox.yml /bin/config.yml

EXPOSE 9115

CMD ["--config.file=/bin/config.yml"]
ENTRYPOINT ["/bin/blackbox_exporter"]
