#! /usr/bin/env bash

set -e

cd /src

pulumi stack select sandbox
pulumi destroy --non-interactive --color=always --yes || :
pulumi stack rm sandbox --non-interactive --color=always --yes
