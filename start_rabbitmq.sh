#!/usr/bin/env bash

docker stop rabbitmq || true
docker rm rabbitmq || true

docker run -d \
  --name rabbitmq \
  --restart unless-stopped \
  -p 5672:5672 \
  -p 15672:15672 \
  -e RABBITMQ_DEFAULT_USER=admin \
  -e RABBITMQ_DEFAULT_PASS=admin123 \
  -v rabbitmq_data:/var/lib/rabbitmq \
  rabbitmq:management
