#!/usr/bin/env bash
# Creates basic OAuth2 clients.
#
# WARNING!!! WARNING!!! WARNING!!!
# For DEVELOPMENT USE ONLY!
#
#   * You should not provide secrets using command line flags.
#     The secret might leak to bash history and similar systems.
#   * The passwords used here are VERY INSECURE.
#   * Restrict grant-types to a FEW AS POSSIBLE.
#   * Restrict scope as much as possible.

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker_image=oryd/hydra:v1.0.0-beta.9-alpine
network=reaction-api
hydra_main_port=4444

docker run --rm -it \
  -p 4000:4000 \
  --network "${network}" \
  "${docker_image}" \
  token user --skip-tls-verify \
    --port 4000 \
    --auth-url http://localhost:4444/oauth2/auth \
    --token-url http://hydra.reaction-api:4444/oauth2/token \
    --redirect http://localhost:4000/callback \
    --client-id reaction-next-starterkit \
    --client-secret CHANGEME \
    --scope openid,offline


