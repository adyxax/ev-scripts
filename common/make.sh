#!/usr/bin/env bash
set -euo pipefail

TARGET=$1

WORKDIR="/tmp/${EVENTLINE_JOB_NAME}"

cleanup() {
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

(cd "${WORKDIR}" && make "${TARGET}")

trap - EXIT
