FROM alpine:latest

RUN apk add --no-cache wget unzip

# Download the correct PocketBase zip
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.27.1/pocketbase_linux_amd64.zip

# Correct filename used here
RUN unzip pocketbase_0.27.1_linux_amd64.zip

# Clean up
RUN rm pocketbase_0.27.1_linux_amd64.zip

# Make the binary executable
RUN chmod +x pocketbase

# Expose port 8090
EXPOSE 8090

# Run PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
