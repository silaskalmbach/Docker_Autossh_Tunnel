# Flexible Autossh Tunnel (Docker)

Minimal Dockerfile to pass any number of ports with autossh through an ssh tunnel. The Dockerfile is designed to allow ssh-keygen to be included without linking them in a separate volume. Well suited to include them in IoT services like Balena.

### Docker-Compose example, as it can also be found in the repository:

```yaml
version: '2.1'

services:
  tunnel:
    build: 
      context: .
      dockerfile: Dockerfile
    restart: unless-stopped
    ports:
      - 3001:3001 #Ports not necessary for an reverse ssh tunnel
    environment:
      - TUNNEL=-R 0.0.0.0:3000:localhost:80 -L 3001:localhost:1880 #as many tunnels as you like
      - SSH_USER=ubuntu
      - KEYNAME=example.key
      - SSH_PORT=22 #22 [Default]
```

---
© Silas Kalmbach