#!/usr/bin/env bash

set -e

usage() {
    cat <<EOF
    Usage: $0 DOCKERHUB_REPO JAR_VERSION"
    Package (e.g. mvn package) project at version JAR_VERSION and build a Docker image tagged DOCKERHUB_REPO:latest.
EOF
}

if [ $# -ne 2 ]; then
  usage
  exit 1
fi

dockerhub_repo="$1"
jar_version="$2"
image="$dockerhub_repo":latest

echo "Updating pom.xml <version> to $jar_version"
mvn org.codehaus.mojo:versions-maven-plugin:2.7:set -DnewVersion=$jar_version

echo "Packaging project"
mvn package -DskipTests

echo "Building Docker image $image"
docker build -t $image --build-arg JAR_VERSION=$jar_version .

