#!/usr/bin/env bash
# Set up environment variables used in .travis.yml config
set -e

export DOCKERHUB_REPO="$TRAVIS_REPO_SLUG"

if [[ -z "$TRAVIS_TAG" ]]; then
  export JAR_VERSION="$TRAVIS_BRANCH"
else
  # Strip leading 'v' from Git tag e.g. v5.4.1 -> 5.4.1
  export JAR_VERSION=${TRAVIS_TAG#v}
fi

