#!/bin/bash
set -e

IMAGE_NAME=$1
TAG=$2

if [[ -z "$IMAGE_NAME" || -z "$TAG" ]]; then
  echo "Usage: $0 IMAGE_NAME TAG"
  exit 1
fi

echo "Pushing Docker image $IMAGE_NAME:latest"
docker push $IMAGE_NAME:latest

echo "Pushing Docker image $IMAGE_NAME:$TAG"
docker push $IMAGE_NAME:$TAG
