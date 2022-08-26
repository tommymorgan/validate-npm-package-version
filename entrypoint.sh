#!/bin/bash

# Store the version number
version=$(jq .version package.json | sed 's/"//g')
echo "::set-output name=version::$version"

# See if tag exists for this version number
version_count=$(git tag -l $version | wc -l | xargs)

if [[ "$version_count" > 0 ]]; then
    exit $version_count
else
    exit 0
fi
