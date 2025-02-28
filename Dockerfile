FROM --platform=amd64 golang:1.23.1-alpine3.20

WORKDIR /orchestrion

COPY orchestrion/go.mod orchestrion/go.sum /orchestrion/

RUN ls && go mod download && go mod verify

COPY orchestrion /orchestrion

# WORKDIR /orchestrion

RUN go install .

# RUN go install github.com/DataDog/orchestrion@v1.1.0

WORKDIR /app

ENV ORCHESTRION_LOG_LEVEL="DEBUG"
ENV GOFLAGS="'-toolexec=orchestrion toolexec'"

RUN --mount=type=bind,target=/app go build -o main /app

CMD ["./main"]
