# Description

This action is meant to be used in CI pipelines and attempts to determine if publishing your package will be successful by checking for the presence of an existing git tag for the version number specified in the package.json.  If the tag exists then it was likely create by a previous `npm/yarn publish` and attempting to publish with the current version number is likely to fail.


# Example usage

`uses: icanbwell/validate-npm-package-version@v1`
