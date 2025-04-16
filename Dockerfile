# Use x86_64 Ubuntu base for SSE2 support
FROM --platform=linux/amd64 ubuntu:22.04

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    zlib1g-dev \
    libpthread-stubs0-dev \
    curl \
    git \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all project files
COPY . ./minimap2

# Optionally set build environment flags
# Uncomment if you want to explicitly avoid arm_neon paths
# ENV sse2only=1

# Build the project using Makefile
#RUN make -j$(nproc)

# # Set default command (can be adjusted as needed)
# CMD ["./minimap2"]
