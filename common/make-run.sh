#!/usr/bin/env bash
set -euo pipefail

WORKDIR="/tmp/${NAME}"

cleanup() {
	cd /
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

git clone -q "${URL}" "${WORKDIR}"
cd "${WORKDIR}"
make run
