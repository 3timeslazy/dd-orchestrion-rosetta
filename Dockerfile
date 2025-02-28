FROM --platform=amd64 golang:1.23.1-alpine3.20

RUN go install github.com/DataDog/orchestrion@v1.1.0

WORKDIR /app

ENV GOFLAGS="'-toolexec=orchestrion toolexec'"

RUN --mount=type=bind,target=/app go build -o main /app

CMD ["./main"]
