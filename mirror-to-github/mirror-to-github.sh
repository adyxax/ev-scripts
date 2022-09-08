#!/usr/bin/env bash
set -euo pipefail

# Input environment:
#   - REPO: The repository path part of the url to mirror, for example: adyxax/www
# Requires a github identity!

WORKDIR="/tmp/$(basename ${REPO})"

cleanup() {
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

git clone -q "https://git.adyxax.org/${REPO}" "${WORKDIR}"
(cd ${WORKDIR}; git remote add github https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${REPO}; git push github --mirror)
