#!/bin/bash

# Store the version number
version=$(jq .version package.json | sed 's/"//g')

# See if tag exists for this version number
version_count=$(git tag -l $version | wc -l | xargs)

if [[ "$version_count" > 0 ]]; then
    exit 1
else
    exit 0
fi
