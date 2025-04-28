FROM alpine:latest

WORKDIR /app

# Install dependencies
RUN apk add --no-cache wget unzip ca-certificates

# Download PocketBase binary
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.27.1/pocketbase_0.27.1_linux_amd64.zip

# Unzip PocketBase
RUN unzip pocketbase_0.27.1_linux_amd64.zip

# Remove zip file
RUN rm pocketbase_0.27.1_linux_amd64.zip

# Make PocketBase executable
RUN chmod +x pocketbase

# Copy your local pb_data folder into the container
COPY pb_data ./pb_data

# Expose PocketBase default port
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
