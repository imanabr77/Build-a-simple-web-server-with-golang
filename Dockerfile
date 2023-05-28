FROM golang:1.18

WORKDIR /app

COPY go.mod go.sum go.main ./

RUN  go mod download 

COPY *.go ./ 

RUN CGO_ENABLED=0 GO111MODULE=on go build -v -o /main -installsuffix cgo -ldflags="-w -s" ./$FRAMEWORK/*.go

RUN cmod +x /main

EXPOSE 8080

CMD ["./main"] 
RUN go run main.go

