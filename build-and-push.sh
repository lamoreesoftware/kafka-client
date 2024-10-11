#!/usr/bin/env bash

set -e

registry="docker.io/lamoreesoftware"
repository="kafka-client"
scala_version="2.13"
kafka_version="3.8.0"
tag="${1:-$kafka_version}"
builder="local"

docker buildx inspect "${builder}" > /dev/null 2>&1 || \
  docker buildx create --name "${builder}" --node local --platform linux/arm64,linux/amd64

docker buildx build --builder "${builder}" --platform=linux/amd64,linux/arm64 --push \
  --build-arg "SCALA_VERSION=${scala_version}" --build-arg "KAFKA_VERSION=${kafka_version}" \
  --tag "${registry}/${repository}:${tag}" --file Dockerfile .
