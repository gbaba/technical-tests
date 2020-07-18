FROM golang:alpine as buildhelper 

ENV GO111MODULE=on

# Install tools required for project with no-cache
RUN apk update --no-cache && apk add git 

WORKDIR /app

ADD ./ /app

RUN go build -o golang-test .

# Using run image
FROM alpine

#Copy binary file from buildhelper
WORKDIR /app
COPY --from=buildhelper /app/golang-test .

ENTRYPOINT ["/app/golang-test"]

EXPOSE 8000
