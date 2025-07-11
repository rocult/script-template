# Workflows - Release

This workflow is only manually ran.
It checks the code, and if successful, it bundles then uploads the bundled code as a GitHub release.
It's able to automatically infer the name and version from the [pesde.toml](https://github.com/rocult/script-template/blob/main/pesde.toml) file.
Make sure to update the name then update the version number on each number.

## Updating the version number correctly

When updating the version number, you should follow the [semver versioning format](https://www.geeksforgeeks.org/introduction-semantic-versioning/).

To break it down:

- The first number should only be incremented if something major was updated that breaks the API or has significant changes
- The second number indicates minor versions that adds features, etc.
- The third and last number is for bug fixes and patches only

On each update, you should also update the [changelog file](https://github.com/rocult/script-template/blob/main/CHANGELOG.md).
