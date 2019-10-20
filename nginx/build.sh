#!/usr/bin/env bash

set -ex

REPOSITORY_NAME="infra/nginx-1.17.4"

$(aws ecr get-login --no-include-email --region ap-northeast-1)
REPOSITORY_URI=$(aws ecr describe-repositories --repository-names $REPOSITORY_NAME --region ap-northeast-1|jq -r .repositories[].repositoryUri)

docker build -t ${REPOSITORY_URI}:latest .
docker push ${REPOSITORY_URI}:latest