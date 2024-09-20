#!/usr/bin/env bash
set -euo pipefail

WORKDIR="/tmp/${EVENTLINE_JOB_NAME}"

cleanup() {
	rm -rf "${WORKDIR}"
}

trap cleanup EXIT

cd "${WORKDIR}"
git-crypt unlock "${EVENTLINE_DIR}/identities/gpg/private_key"

podman run --rm -ti -v "${WORKDIR}:/mnt" \
       --entrypoint "/bin/sh" \
       localhost/ods:latest \
       /bin/cp /usr/local/bin/ods /mnt/

SSHKEY="${EVENTLINE_DIR}/identities/ssh/private_key"
SSHOPTS="-i ${SSHKEY} -o StrictHostKeyChecking=accept-new"

rsync -e "ssh ${SSHOPTS}" "${WORKDIR}/ods" root@ods.adyxax.org:/srv/ods/
ssh root@ods.adyxax.org "systemctl restart ods"

trap - EXIT
