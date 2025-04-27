# Start from a lightweight Go base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Install wget and ca-certificates
RUN apk add --no-cache wget ca-certificates

# Download the latest PocketBase release
RUN wget https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_linux_amd64.zip && \
    unzip pocketbase_linux_amd64.zip && \
    rm pocketbase_linux_amd64.zip && \
    chmod +x pocketbase

# Expose PocketBase port
EXPOSE 8090

# Run PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
