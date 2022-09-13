#!/usr/bin/env bash
set -euo pipefail

URL=$1

WORKDIR="/tmp/${EVENTLINE_JOB_NAME}"

cleanup() {
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

git clone -q "${URL}" "${WORKDIR}"

trap - EXIT
