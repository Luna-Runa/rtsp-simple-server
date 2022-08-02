FROM golang:1.18-alpine3.15

RUN apk add --no-cache ffmpeg

WORKDIR /s

COPY go.mod go.sum ./

RUN go mod download

COPY . ./

RUN go build -o /out .

WORKDIR /

COPY ./rtsp-simple-server-temp.yml ./rtsp-simple-server.yml

CMD ["sh", "-c", "/out"]