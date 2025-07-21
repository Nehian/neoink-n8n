FROM n8nio/n8n:latest

USER root

# Create data directory
RUN mkdir -p /data && chown -R node:node /data

# Install additional tools we'll need
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    curl

USER node

EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s \
    CMD curl -f http://localhost:5678/healthz || exit 1
