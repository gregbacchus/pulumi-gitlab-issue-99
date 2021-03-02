#! /usr/bin/env bash

set -e

[ -z "$GITLAB_BASE_URL" ] && echo "Env var GITLAB_BASE_URL not set" && exit 1
[ -z "$GITLAB_TOKEN" ] && echo "Env var GITLAB_TOKEN not set" && exit 1
[ -z "$PULUMI_CONFIG_PASSPHRASE" ] && echo "Env var PULUMI_CONFIG_PASSPHRASE not set" && exit 1

docker run -it --rm \
  --entrypoint bash \
  -w /src \
  -v "$PWD:/src" \
  -e "GITLAB_BASE_URL=$GITLAB_BASE_URL" \
  -e "GITLAB_TOKEN=$GITLAB_TOKEN" \
  -e "PULUMI_CONFIG_PASSPHRASE=$PULUMI_CONFIG_PASSPHRASE" \
  pulumi/pulumi:v2.21.2
