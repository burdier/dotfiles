#!/bin/bash
# shellcheck disable=1090
# Install a version of node using nvm
VERSION="${1}"
if [ -z "$VERSION" ]
then
  echo -e "Options:\n\tnvmc\t<Version>\tE.g. => 6"
  exit 1
fi
VERSION_TO_FIND="v$VERSION"
VERSION_FOUND=$(. ~/.nvm/nvm.sh; nvm list | grep "$VERSION_TO_FIND")
[[ "${VERSION_FOUND}" ]] || echo "nvm install ${VERSION}"
echo "nvm use ${VERSION}"
