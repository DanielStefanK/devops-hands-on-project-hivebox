FROM golang:1.24.2-alpine3.21 AS builder


RUN apk add --no-cache git
WORKDIR /app
COPY . .
RUN GIT_COMMIT=$(git rev-parse HEAD) && \
    GIT_TAG=$(git describe --tags --dirty --always || echo "no-tag") && \
    go build -ldflags "-X main.GitCommit=$GIT_COMMIT -X main.GitTag=$GIT_TAG" -o main .
RUN go mod download

FROM alpine:3.21
WORKDIR /app
COPY --from=builder /app .


CMD ["/app/main"]
EXPOSE 8080
