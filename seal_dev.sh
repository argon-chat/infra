#!/usr/bin/env sh

#if [ -z "$1" ] || [ -z "$2" ]; then
#  echo "Usage: ./seal.sh <file-to-seal> <path-to-new-sealed-secret>"
#  exit 1
#fi
#
#kubeseal --format=yaml --cert=pub-sealed-secrets.pem < "$1" > "$2"

for file in .secrets/dev/*.yaml; do
  kubeseal --format=yaml --cert=pub-sealed-secrets-dev.pem < "$file" > "clusters/argon-dev/secrets/$(basename "$file")"
done