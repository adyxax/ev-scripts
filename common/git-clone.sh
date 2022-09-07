#!/usr/bin/env bash
set -euo pipefail

NAME=$1
URL=$2

WORKDIR="/tmp/${NAME}"

cleanup() {
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

git clone -q "${URL}" "${WORKDIR}"

trap - EXIT
