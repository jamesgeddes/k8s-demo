# Stage 1: Download binary with AWS CLI
FROM alpine:3.16.7@sha256:b7976818ac23c46dbc69437dd41c5ba32750f0345ad706209d2208b4db84e1e8 as downloader

# Install AWS CLI
RUN apk --no-cache add aws-cli

# Temporary working directory
WORKDIR /tmp

# Download the binary from S3
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG ARTEFACTS_BUCKET_URL
RUN aws s3 cp "${ARTEFACTS_BUCKET_URL}/demo-service" ./demo-service

# Make the binary executable
RUN chmod +x ./demo-service

# Stage 2: Build the final image without AWS CLI
FROM alpine:3.16.7@sha256:b7976818ac23c46dbc69437dd41c5ba32750f0345ad706209d2208b4db84e1e8

# Set the working directory in the container
WORKDIR /home/app

# Copy the binary from the downloader stage
COPY --from=downloader /tmp/demo-service ./demo-service

# Create a config directory and copy the configuration file
RUN mkdir config
COPY configuration.yaml /home/app/config/configuration.yaml

# Expose the necessary ports
EXPOSE 8080 8081

# Run the binary with the required command when the container starts
CMD ["./demo-service", "ports-and-adapters"]
