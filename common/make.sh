#!/usr/bin/env bash
set -euo pipefail

NAME=$1
TARGET=$2

WORKDIR="/tmp/${NAME}"

cleanup() {
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

(cd "${WORKDIR}" && make "${TARGET}")

trap - EXIT
