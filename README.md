# mcp-proxy-npx

Docker image extending [`ghcr.io/sparfenyuk/mcp-proxy`](https://github.com/sparfenyuk/mcp-proxy) with support for:

- **npx** — run MCP servers distributed as npm packages
- **uv** — run MCP servers distributed as Python packages

## Image

```
ghcr.io/azrod/mcp-proxy-npx
```

| Tag | Description |
|-----|-------------|
| `latest` | Updated on push to `main` **and** on semver tag (`v*`) — prefer a pinned tag for stability |
| `1.2.3` / `1.2` / `1` | Pinned to a specific release |

## Usage

### docker-compose example

```yaml
services:
  mcp-proxy:
    image: ghcr.io/azrod/mcp-proxy-npx:latest
    ports:
      - "8080:8080"
    command:
      - "--port=8080"
      - "--named-server"
      - "filesystem=npx,-y,@modelcontextprotocol/server-filesystem,/data"
    volumes:
      - ./data:/data
```

This starts mcp-proxy on port 8080 with a `filesystem` MCP server backed by `@modelcontextprotocol/server-filesystem`.

### Build with a specific mcp-proxy version

```bash
docker build --build-arg MCP_PROXY_VERSION=0.1.8 -t mcp-proxy-npx .
```

## Credits

- [sparfenyuk/mcp-proxy](https://github.com/sparfenyuk/mcp-proxy) — the upstream MCP proxy
