#!/bin/bash
set -e

IMAGE_NAME=$1
TAG=$2

if [[ -z "$IMAGE_NAME" || -z "$TAG" ]]; then
  echo "Usage: $0 IMAGE_NAME TAG"
  exit 1
fi

echo "Building Docker image: $IMAGE_NAME with tags latest and $TAG"
docker build -t $IMAGE_NAME:latest -t $IMAGE_NAME:$TAG .
