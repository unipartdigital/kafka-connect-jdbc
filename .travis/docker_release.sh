#!/usr/bin/env bash

set -e

usage() {
    cat <<EOF
    Usage: $0 FROM_IMAGE TO_IMAGE"
    Push existing Docker image FROM_IMAGE as TO_IMAGE.
EOF
}

if [ $# -ne 2 ]; then
  usage
  exit 1
fi

from_image="$1"
to_image="$2"

echo "Pushing $from_image as $to_image"
docker tag "$from_image" "$to_image" && docker push "$to_image"
