#!/bin/bash -eu

LUANTI_REV=`cat luanti.rev`

if ! git diff-index --quiet --cached HEAD ; then
  echo "Update detected. Pushing changes"
  git commit -m "Luanti: ${LUANTI_REV}"
  git push "https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
  DID_PUSH=true
else
  echo "No update detected"
  DID_PUSH=false
fi

if [ -n "${GITHUB_ENV:-}" ]; then
  echo "DID_PUSH=$DID_PUSH" >> "$GITHUB_ENV"
fi
