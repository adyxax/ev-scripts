#!/usr/bin/env bash
set -euo pipefail

WORKDIR="/tmp/ev-scripts-deploy"

cleanup() {
	cd
	rm -rf ${WORKDIR}
}

trap cleanup EXIT

git clone -q --depth 1 https://git.adyxax.org/adyxax/ev-scripts.git ${WORKDIR}
cd ${WORKDIR}
make run
