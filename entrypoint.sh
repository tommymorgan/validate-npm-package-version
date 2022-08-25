#!/bin/sh -l

# Store the version number
version=$(echo "console.log(require('./package.json').version);" | node)

# See if tag exists for this version number
version_count=$(git tag -l v$version | wc -l | xargs)

if [ $version_count == '1' ]; then
    result='failure'
else
    result='success'
fi

echo "::set-output name=version::$version"
echo "::set-output name=result::$result"
