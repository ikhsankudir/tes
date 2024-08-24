#!/bin/bash

# Variabel konfigurasi
TUNNEL_NAME="my-tunnel"
TOKEN="eyJhIjoiZWExOTQ0MDg3YmI0MzU5ZjJmOTQ5MzI1ZmU3ZTIxMzgiLCJ0IjoiNTBkMDgyYjUtMmY1My00ZGQxLWFlNDUtMzQ1MWEyMDAxYWFmIiwicyI6IlpESTJZV1l4WVRRdE1HRmpNaTAwTkRkaExUazVZamN0TWpneVlUSmpNVEF4TlRFNSJ9"

# Nama gambar Docker cloudflared
IMAGE="cloudflare/cloudflared:latest"

# Hapus container lama jika ada
echo "Removing any existing cloudflared container..."
docker rm -f cloudflared-tunnel || true

# Tarik gambar Docker terbaru
echo "Pulling the latest cloudflared Docker image..."
docker pull $IMAGE

# Jalankan container cloudflared dengan tunnel
echo "Starting cloudflared tunnel..."
docker run -d \
  --name cloudflared-tunnel \
  --restart unless-stopped \
  $IMAGE tunnel --no-autoupdate run --token $TOKEN

# Tampilkan status container
echo "Container is running. Check the logs for details."
