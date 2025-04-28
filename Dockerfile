FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache wget ca-certificates unzip

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.27.1/pocketbase_0.27.1_linux_amd64.zip && \
    unzip pocketbase_0.27.1_linux_amd64.zip && \
    rm pocketbase_0.27.1_linux_amd64.zip && \
    chmod +x pocketbase

# No COPY pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
