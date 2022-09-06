#!/usr/bin/env bash
set -euo pipefail

# Input environment:
# - NAME: a name for the script/tasks
# - TARGET: the Makefile target to run

WORKDIR="/tmp/${NAME}"

cleanup() {
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

(cd "${WORKDIR}" && make "${TARGET}")

trap - EXIT
