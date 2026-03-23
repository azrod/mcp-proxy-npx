# ARG before FROM is only available in the FROM instruction, not in subsequent RUN/LABEL/etc.
ARG MCP_PROXY_VERSION=0.11.0
FROM ghcr.io/sparfenyuk/mcp-proxy:${MCP_PROXY_VERSION}

LABEL org.opencontainers.image.source="https://github.com/azrod/mcp-proxy-npx"
LABEL org.opencontainers.image.description="mcp-proxy with npx (Node.js) and uv (Python) support"
LABEL org.opencontainers.image.licenses="MIT"

ENV UV_PYTHON_PREFERENCE=only-system

RUN apk add --no-cache nodejs npm py3-pip \
    && pip install --no-cache-dir uv==0.6.14

ENTRYPOINT ["mcp-proxy"]
