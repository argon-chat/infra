#!/usr/bin/env sh

if ! command -v flux &> /dev/null
then
    echo "flux could not be found"
    exit 1
fi

flux get kustomizations --watch