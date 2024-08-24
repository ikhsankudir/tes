version: '3.8'

services:
  portainer:
    image: portainer/portainer-ce
    container_name: portainer
    ports:
      - "9000:9000"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data
    restart: unless-stopped

  cloudflared:
    image: cloudflare/cloudflared:latest
    container_name: cloudflared
    volumes:
      - /path/to/credentials.json:/etc/cloudflared/config.json
    command: tunnel --no-autoupdate run --hostname portainer.example.com --url http://portainer:9000
    restart: unless-stopped

volumes:
  portainer_data:
