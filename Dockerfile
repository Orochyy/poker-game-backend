FROM golang:latest

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .


#FROM builder as dev
#
#RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
#
#WORKDIR /go/src/app
#
#CMD ["air", "-c", ".air.toml"]