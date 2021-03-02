#! /usr/bin/env bash

set -e

rm -rf /app

mkdir -p /app
cd /app

cp /src/index.ts .
cp /src/package* .
cp /src/Pulumi.yaml .

npm ci

pulumi login --local
pulumi plugin install resource gitlab v3.4.0

pulumi stack init sandbox
pulumi stack select sandbox

pulumi up --non-interactive --color=always --emoji --yes --suppress-outputs
