#!/bin/bash

# Store the version number
version=$(jq .version package.json | sed 's/"//g')

# See if tag exists for this version number
version_count=$(git tag -l v$version | wc -l | xargs)

if [[ "$version_count" > 0 ]]; then
    result='failure'
else
    result='success'
fi

echo "::set-output name=version::$version"
echo "::set-output name=version_count::$version_count"
echo "::set-output name=result::$result"

if [[ "$result" == "failure" ]]; then
    exit 1
else
    exit 0
fi
