#!/usr/bin/env bash
set -euo pipefail

# Input environment:
# - NAME: a name for the script/tasks
# - URL: the url of the repository to clone

WORKDIR="/tmp/${NAME}"

cleanup() {
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

git clone -q "${URL}" "${WORKDIR}"

trap - EXIT
