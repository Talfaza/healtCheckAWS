FROM golang:1.23
WORKDIR /app
COPY go.mod go.sum ./

RUN go mod  download 
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
EXPOSE 8000
CMD ["/docker-gs-ping"]
